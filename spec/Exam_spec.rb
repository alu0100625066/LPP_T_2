require 'Exam'

class Question
	describe Question do
			
		before :each do
			@q = Question.new(:qt => '1+1=', :r1 => 2, :wrong => [3,5,7])
		end
						
		context "Simple_Selection" do
			it ":Debe existir una pregunta" do
				expect(@q.qt)== '1+1='
			end
			it ":Deben existir opciones de respuesta" do
				expect(@q.r1)== 2
				expect(@q.wrong)== [3,5,7]
			end
				#expect(@q).to be_instance_of(LPP_T_02::Question)			
				#Esta línea comprueba que el objeto q sea un objeto instanciado de nuestra clase Question 
			it ":Se debe invocar un método para obtener la pregunta" do
				expect(@q).to respond_to :qt
			end
			it ":Se debe invocar a un método para obtener las opciones de respuesta" do
				expect(@q).to respond_to :r1
				expect(@q).to respond_to :wrong
			end		
			it ":Se deben mostrar por la pantalla la pregunta y las opciones" do
				expect(@q).to respond_to :to_s
			end
		end
	end
end
	
class Exam
	describe Exam do
		
		before :each do
			@q = Question.new(:qt => '2+2=', :r1 => 4, :wrong => [2,5,8])
			@n = Node.new (@q)
			@e = Exam.new(@q)
		end
		
		context "Node" do
			it "#Debe existir un Nodo de la lista con sus datos y su siguiente" do
				expect(@n.value)==@q
				expect(@n.next)==nil
			end
		end
		
		context "List" do
			it "#Se extrae el primer elemento de la lista" do
				expect(@e).to respond_to :pop
				expect(@e.pop)==@q
			end
			it "#Se puede insertar un elemento" do
				expect(@e.push).to respond_to :push
				a = [@q, @q, @q]
				expect(@e.push(a))==a
		end
	end
end
