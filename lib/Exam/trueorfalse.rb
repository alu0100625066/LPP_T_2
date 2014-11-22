require 'question'

class TrueOrFalse < Question
	def initialize (args)
		raise ArgumentError,"Se esperaba una pregunta" unless args.key?(:qt)
		raise ArgumentError,"Se esperaba la pregunta correcta" unless args.key?(:r1)
		args[:r1] = (args[:r1] ? "Cierto" : "Falso")
		args[:wrong] = [(args[:r1] ? "Falso" : "Cierto")]
		super(args)
	end
end
