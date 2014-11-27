# coding: UTF-8
require 'examen'

class Examui
	attr_accessor :examui
	
	def initialize(o)
		@examui = Exam.new(o)
	end
	
	def compare(useranswers)
		right = @examui.right
		comp = Array.new(right.count, false)
		i = 0
		while i < right.count do
			comp[i] = (right[i].eql?useranswers[i])? true : false
			i += 1
		end
		comp
	end

end
