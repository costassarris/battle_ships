require 'board'

describe Board do

	let(:board) {Board.new}
	let(:ship1) {double :ship, length: 1}
	let(:ship2) {double :ship, length: 2}
	let(:ship3) {double :ship, length: 3}
	let(:marker) {double :marker, location:['A1']}


	it 'can place a ship at a location A1' do
		expect(board.place(ship1, ['A1'])).to eq (['A1'])
	end


	it 'can place a ship at a location B2' do
		expect(board.place(ship1, ['B2'])).to eq (['B2'])
	end


	it 'can place a ship of length 2 on A1 and B1' do
		expect(board.place(ship2, ['A1','B1'])).to eq (['A1', 'B1'])
	end


	it 'can place a ship of length 2 facing south, starting at A1' do
		expect(board.place_south(ship2,['A1'])).to eq(['A1','A2'])
	end


	it 'can place a ship of length 3 facing south, starting at A1' do
		expect(board.place_south(ship3,['A1'])).to eq(['A1','A2', 'A3'])
	end


	it 'can place a ship of length 3 facing east, starting at A1' do
		expect(board.place_east(ship3,['A1'])).to eq(['A1','B1', 'C1'])
	end


	it 'raise an error when a ship is placed outside of the board (east)' do
		expect{ board.place_east(ship2,['J1'])}.to raise_error("Can't be placed outside board")
	end


	it 'raise an error when a ship is placed outside of the board (south)' do
		expect{ board.place_south(ship3,['A9'])}.to raise_error("Can't be placed outside board")
	end


	it 'can know that the hit has missed the ship' do
		board.place_east(ship2, ['A1'])
		expect(board.fire(marker)).not_to eq(['A1', 'B1'])
	end

	it 'can know that the ship has been hit' do
		board.place_east(ship2,['A1'])
		board.fire(marker)
		expect(ship).to be_hit
	end

end