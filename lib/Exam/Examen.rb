# coding: utf-8
require "Exam"

class Examen
	attr_accessor :exam

	def initialize(o)
	@exam = Exam.new(o)
	end

	def to_s
		s="#{@list}"
		s
	end

	def <<(o)
	@list << o

	end

	def push(*input)
	input.each { |o| @exam << o}
	input
	end

end
