# coding: utf-8
require 'list'


#Clase para la gestión de examens con preguntas.
class Exam
	attr_accessor :exam

#Creacion de una isntancia a partir de una pregunta.
	def initialize(o)
		@exam = List.new(o)
	end

#Metodo to_s.
	def to_s
		"#{@exam}"
	end


#Metodo para la inserción de preguntas sucesivamente.
	def push(*input)
	input.each { |o| @exam.push(o)}
	input
	end
	
#Metodo para obtener el conjunto de respuestas correctas asociadas a las respuestas.
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
