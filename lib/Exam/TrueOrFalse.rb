class TrueOrFalse < Question
	def initialize (args)
		raise ArgumentError,"Se esperaba una pregunta" unless args.key?(:qt)
		raise ArgumentError,"Se esperaba la pregunta correcta" unless args.key?(:r1)
		super(:qt=>args[:qt],:r1=> (args[:r1] ? "Cierto" : "Falso"), :wrong => [(args[:r1] ? "Falso" : "Cierto")])
	end
end
