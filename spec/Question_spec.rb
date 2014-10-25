require 'LPP_T_02/Question'

module LPP_T_02
	class Question
	
		describe LPP_T_02::Question do
			
			before :each do
				@q = LPP_T_02::Question.new(:qt => '1+1=', :r1 => 2, :wrong => [3,5,7])
			end
			
			context "Al realizar la pregunta" do
				it "Debe existir la pregunta" do
					expect(@q.qt)== '1+1='
				end
				it "Debe contener opciones para la respuesta" do
					expect(@q.r1)==2
					expect(@q.wrong)==[3,5,7]
				end
					#expect(@q).to be_instance_of(LPP_T_02::Question)			
					#Esta línea comprueba que el objeto q sea un objeto instanciado de nuestra clase Question 
				
			end
			
		end
	end
end
