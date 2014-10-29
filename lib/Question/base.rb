	class Question
		attr_accessor :qt, :r1, :wrong
		
		def initialize (args)
			@qt = args[:qt]
			raise ArgumentError, "Se esperaba una pregunta" unless args[:qt]
			@r1 = args[:r1]
			raise ArgumentError, "Se esperaba la respuesta correcta" unless args[:r1]
			@wrong = args[:wrong]
			raise ArgumentError, "Se esperaba un array con las respuestas incorrectas" unless args[:wrong]
		end
		
		def show
			puts "#{@qt}"
			opt = @r1 + @wrong
			opt = opt.shuffle
			for i in(1..4)
				puts "#{i} - #{opt[i]}"
			end
		end
		
	end
