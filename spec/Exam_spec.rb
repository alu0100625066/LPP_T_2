require 'Question'

	class Question
	
	
		describe Question do
			
			before :each do
				@q = Question.new(:qt => '1+1=', :r1 => 2, :wrong => [3,5,7])
			end
			
			
			context "Al realizar la pregunta" do
				it "Debe existir la pregunta" do
					expect(@q.qt)== '1+1='
				end
				it "Debe contener opciones para la respuesta" do
					expect(@q.r1)== 2
					expect(@q.wrong)== [3,5,7]
				end
					#expect(@q).to be_instance_of(LPP_T_02::Question)			
					#Esta línea comprueba que el objeto q sea un objeto instanciado de nuestra clase Question 
			end
			
			
			context "Se debe poder invocar" do
				it "un método para obtener la pregunta" do
					expect(@q).to respond_to :qt
				end
				it "un método para obtener las opciones de respuesta" do
					expect(@q).to respond_to :r1
					expect(@q).to respond_to :wrong
				end
			end
			
			
			it "Debe mostrarse por la pantalla la pregunta y las opciones" do
				expect(@q).to respond_to :to_s
			end
			
			
		end
	end
