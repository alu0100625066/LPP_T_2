

#Clase para la gestion de preguntas de multiples opciones.
class Question
		attr_accessor :qt, :r1, :wrong, :difficulty
		
#Se incluye el método Comparable
		include Comparable
		
		def <=>(other)
			@difficulty <=> other.difficulty
		end
		
		def ==(other)
			@qt.eql?other.qt
		end
		

#Inicializacion de una nueva instancia de una nueva pregunta a partir de un texto.
		def initialize (args)
			@qt = args[:qt]
			raise ArgumentError, "Se esperaba una pregunta" unless args.key?(:qt)
			@r1 = args[:r1]
			raise ArgumentError, "Se esperaba la respuesta correcta" unless args.key?(:r1)
			@wrong = args[:wrong]
			raise ArgumentError, "Se esperaba un array con las respuestas incorrectas" unless args.key?(:wrong)
			args.has_key?(:difficulty)? (@difficulty = args[:difficulty]) : (@difficulty = 1)
		end
		

#Metodo to_s.
		def to_s
			s = "#{@qt}\n"
			opt = [@r1] + @wrong
			opt = opt.shuffle
			i = 1
			opt.each do |o|
				s += "#{i}- #{o}\n"
				i += 1
			end
			s
		end
		
	end
