class Hey
	def method_missing(m)
		"#{m.capitalize}?"
	end
end

h = Hey.new
puts h.hello
puts h.no
puts h.something

=begin	
when you give ruby a method that it doesnt recognize, it calls method_missing. So what we're doing here
is defining method missing and overriding the method_missing that ruby calls, making it call our function instead
=end