require 'ship'

describe Ship do

	let(:ship){Ship.new}


	it 'should know its default size' do
		expect(ship.length).to eq 2
	end


	it 'should know that the submarine has a length of 3' do
    submarine = Ship.submarine
		expect(submarine.length).to eq 3
	end


  it 'should know that the aircraft carrier has a length of 5' do
    aircraft_carrier = Ship.aircraft_carrier
    expect(aircraft_carrier.length).to eq 5
  end


  it 'knows when it is hit' do
    ship.hit!
    expect(ship.hits).to eq 1
  end


  it 'should know when it is not sunk' do
    expect(ship).not_to be_sunk
  end


  it 'should know when it is sunk' do
    ship = Ship.new(2)
    ship.hit!
    ship.hit!
    expect(ship).to be_sunk
  end


end