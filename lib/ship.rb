class Ship

	attr_reader :length


	def initialize(length = 2)
    @length = length
    @hits = 0
	end


	def self.submarine
	   new 3
	end


	def self.aircraft_carrier
		new 5
	end


  def sunk?
    hits >= length
  end


  def hit!
    @hits+=1
  end

  def hits
  	@hits
  end



end