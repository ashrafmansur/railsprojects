class Student < ApplicationRecord

	validates :age, numericality: {
		greater_than_or_equal_to: 25
	}

	enum grade: {
		"A": 1,
		"B": 2,
		"C": 3,
		"D": 4,
		"E": 5
	}

	enum gender: {
		"male": 1,
		"female": 0
	}

	scope :female,       -> {where(gender: "female")}
	scope :male,         -> {where(gender: "male")}
	scope :plays_sports, -> {where(plays_sports: true)}
	scope :grade,        -> {where(grade: "A")}
	scope :davida,       -> {where(firstname: "David")}

	class << self

	def special
		puts Student.male.grade.plays_sports
	end

	def gendercall(gender)
			puts gender
			Student.where(gender: gender).each do |s|
			puts "#{s.firstname} #{s.lastname}, #{s.age}"
			end	
	end

	def gradesort
		puts "#{Student.group(:grade).count} students"
	end

	def avggrade
		genderunique = Student.select(:gender).distinct
		genderunique.each do |s|
			puts "#{s.gender} = average #{Student.where(gender:s.gender).average(:grade)}"
		end
	end

	def newavggrade
		Student.group(:gender).average(:grade)
	end

	def samename
		Student.select(:firstname, :lastname).group(:firstname).having("count(*) > 1")
	end

	def newsamename
		Student.select("firstname, count(firstname) as quantity").group(:firstname).having("quantity > 1")

	end

	def newnewsamename
		Student.where(firstname: Student.select("firstname").group(:firstname).having("count(firstname)  > 1"))
		
	end

	def longlastname
		lastnamearray = Student.select(:lastname).pluck(:lastname)
		lastnamearray.each do |s|
			if (s.length > 7)
				puts "#{s}"
			end
		end
	end

	end
end
