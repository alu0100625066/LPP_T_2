require 'question'


#Clase de gestion de preguntar True or False.
class TrueOrFalse < Question

#Inicializacion de la isntancia de la clase TrueOrFalse al cual se le pasa un texto para la pregunta y un booleano para la respuesta.
	def initialize (args)
		raise ArgumentError,"Se esperaba una pregunta" unless args.key?(:qt)
		raise ArgumentError,"Se esperaba la pregunta correcta" unless args.key?(:r1)
		args[:r1] = (args[:r1] ? "Cierto" : "Falso")
		args[:wrong] = [(args[:r1] ? "Falso" : "Cierto")]
		super(args)
	end
end
