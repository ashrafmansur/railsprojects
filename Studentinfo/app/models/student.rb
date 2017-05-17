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

	def self.gendercall(gender)
		if (gender == 0)
			puts "Female"

			Student.where(gender:0).each do |s|
			puts "#{s.firstname} #{s.lastname}, #{s.age}"			
			end
		else
			puts "Male"
			Student.where(gender:1).each do |s|
			puts "#{s.firstname} #{s.lastname}, #{s.age}"			
			end
		end
	
	end

	def self.gradesort
	gradeunique = Student.select(:grade).distinct
		gradeunique.each do |s|
			puts "#{s.grade} = #{Student.where(grade:s.grade).count} students"
		end
	end

	def self.avggrade
	genderunique = Student.select(:gender).distinct
		genderunique.each do |s|
			puts "#{s.gender} = average #{Student.where(gender:s.gender).average(:grade)}"
		end
	end

	def self.newavggrade
		Student.group(:gender).average(:grade)
	end

	def self.samename
		Student.select(:first,:firstname).group(:first,:firstname).having("count(*) > 1")
	end

	def self.newsamename
		Student.select("firstname, count(firstname) as quantity").group(:firstname).having("quantity > 1")
	end

	def self.longlastname
		lastnamearray = Student.select(:lastname).pluck(:lastname)
		lastnamearray.each do |s|
			if (s.length > 7)
				puts "#{s}"
			end
		end
	end


end
