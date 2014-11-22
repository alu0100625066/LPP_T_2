# coding: utf-8
require 'list'

class Examen
	attr_accessor :exam

	def initialize(o)
	@exam = List.new(o)
	end

	def to_s
		"#{@exam}"
	end

	def push(*input)
	input.each { |o| @exam << o}
	input
	end

end
