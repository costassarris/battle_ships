class Board


	def place(ship, coord)
		coord.each do |c|
			coords << c
		end
	end

	def coords
		@coords = []
	end


	def ships
		@ships ||= []
	end


	def locate(ship)
		ship.coord
	end


end