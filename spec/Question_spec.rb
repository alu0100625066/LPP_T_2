require 'LPP_T_02/Question'

module LPP_T_02
	class Question
	
		describe LPP_T_02::Question do
			
			before :each do
				@q = LPP_T_02::Question.new(:qt => '1+1=', :r1 => 2, :wrong => [3,5,7])
			end
			
			context "Al realizar la pregunta" do
				it "Debe tener los tres componentes" do
					expect(@q).to be_instance_of(LPP_T_02::Question) 
				end
			end
			
		end
	end
end
