# coding: utf-8
require 'list'

class Exam
	attr_accessor :exam

	def initialize(o)
		@exam = List.new(o)
	end

	def to_s
		"#{@exam}"
	end

	def push(*input)
	input.each { |o| @exam.push(o)}
	input
	end
	
	def right
		result = Array.new()
		i=0
		@exam.each do |q|
			result[i] = q.r1
			i += 1
		end
		result
	end

end
