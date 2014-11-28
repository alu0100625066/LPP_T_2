# coding: UTF-8
require 'examen'


#Clase para la muestra de examenes con interfaz grafica.
class Examui
	attr_accessor :examui
	
#inicialización de la instancia a partir de una pregunta.
	def initialize(o)
		@examui = Exam.new(o)
	end
	

#Comparacion de respuestas que se evaluan con la indicacion de cuales son correctas y cuales no.
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
