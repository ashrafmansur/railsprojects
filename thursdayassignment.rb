class Computer
	#assigning
	def keyboard=(str)
		@keyboard = str
	end

	#calling
	def keyboard
		@keyboard	
	end

	


	def monitor
		@monitor
	end

	def monitor=(str)
		@monitor = str
	end


	def cpu
		@cpu
	end

	def cpu=(integer)
		@cpu = integer
	end

end

c = Computer.new

c.keyboard = "Razer"
puts c.keyboard
c.monitor = "Dell"
puts c.monitor
c.cpu = 123
puts c.cpu

=begin
reading and writing values to an instance of a class	
=end