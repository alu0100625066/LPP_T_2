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
			it "#Se extrae el primer elemento de la lista"
				expect(@e.pop)==@q
			end
		
	end



=begin
it "Debe mostrarse correctamente" do
        text = "¿Cuál es la salida del siguiente código Ruby?\nclass Xyz\n\sdef pots\n\s\s@nice\n\send\nend\n\nxyz = Xyz.new\np xyz.pots"
        exam = Exam.new(question.new(:text => text, :right =>"nil", :wrong => ["#<Xyz:0xa000208>","nil","0","Ninguna de las anteriores"]))

        text = "La siguiente definición de un hash en Ruby es válida:\nhash_raro = {\n\s[1, 2, 3] => Object.new(),\nHash.new => :toto\n}"
        examen << Question.new(:text => text, :right =>"False", :wrong => ["True"])

        text = %Q{¿Cuál es la salida del siguiente código Ruby?\nclass Array\n\sdef say_hi\n\s\s"HEY!"\n\send\nend\n p [1, "bob"].say_hi}
        exam <<Question.new(:text => text, :right =>"HEY!", :distractors => ["1","bob","Ninguna de las anteriores"])
   
        text = "¿Cuál es el tipo del objeto en el siguiente código Ruby?\nclass Objeto\nend"
        exam << Question.new(:text => text, :right =>"Una instancia de la clase Class", :wrong => ["Una Constante", "Un Objeto", "Ninguna de las anteriores"])
   
        text = "Es apropiado que una clase Tablero herede de una clase Juego"
        exam << Question.new(:text => text, :right =>"False", :wrong => ["True"])

=end

end
