# coding: utf-8
require 'spec_helper'
require 'Exam'

class Question
	describe Exam do
			
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
			
			it ":Se debe poder invocar al operador <=> del módulo comparable" do
				expect(@q<=>@q)== 1
			end
			
		end
	end
end

class TrueOrFalse 
	describe Exam do
	
		before :each do
			@q = TrueOrFalse.new(:qt => '¿Es verdad que 2+2=4 ?', :r1 => true) 
		end
		
		context "TrueOrFalse" do
		
			it ":Debe ser una instancia de la clase Question" do
				expect(@q).instance_of? (Question)
			end
		
			it ":Debe existir una pregunta" do
				expect(@q.qt)== '¿Es verdad que 2+2=4 ?'
			end
			
			it "*Deben existir opciones de respuesta" do
				expect(@q.r1)== "Cierto"
				expect(@q.wrong)== "Falso"
			end
			
			it "*Se debe invocar un método para obtener la pregunta" do
				expect(@q).to respond_to :qt
			end
			
			it "*Se debe invocar a un método para obtener las opciones de respuesta" do
				expect(@q).to respond_to :r1
				expect(@q).to respond_to :wrong
			end		
			
			it "*Se deben mostrar por la pantalla la pregunta y las opciones" do
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
				expect(@n.prev)==nil    
			end
		end
		
		context "List" do
		
			it "#Se extrae el primer elemento de la lista" do
				expect(@e).to respond_to :pop
				expect(@e.pop)==@q
			end
			
			it "#Se puede insertar un elemento" do
				a = @q
				expect(@e).to respond_to :push
				expect(@e.push(a))==a
			end
			
			it "#Se pueden insertar varios elementos" do
				a = [@q, @q, @q]
				expect(@e).to respond_to :push
				expect(@e.push(a))==a
			end
			
			it "#Debe existir una Lista con su cabeza" do
				expect(@e).to respond_to :head
			end
			
			it "#Debe existir el modulo Enumerable" do
			expect(@e).to be_kind_of? Enumerable
			end
			
			it "Debe mostrarse correctamente" do
      	text = "\n¿Cuál es la salida del siguiente código Ruby?\nclass Xyz\n\sdef pots\n\s\s@nice\n\send\nend\n\nxyz = Xyz.new\np xyz.pots"
        exam = Exam.new(Question.new(:qt => text, :r1 =>"nil", :wrong => ["#<Xyz:0xa000208>","0","Ninguna de las anteriores"]))

        text = "La siguiente definición de un hash en Ruby es válida:\nhash_raro = {\n\s[1, 2, 3] => Object.new(),\nHash.new => :toto\n}"
        exam.push(TrueOrFalse.new(:qt => text, :r1 => false))

        text = %Q{¿Cuál es la salida del siguiente código Ruby?\nclass Array\n\sdef say_hi\n\s\s"HEY!"\n\send\nend\n p [1, "bob"].say_hi}
        exam.push(Question.new(:qt => text, :r1 =>"HEY!", :wrong => ["1","bob","Ninguna de las anteriores"]))
   
        text = "¿Cuál es el tipo del objeto en el siguiente código Ruby?\nclass Objeto\nend"
        exam.push(Question.new(:qt => text, :r1 =>"Una instancia de la clase Class", :wrong => ["Una Constante", "Un Objeto", "Ninguna de las anteriores"]))
   
        text = "Es apropiado que una clase Tablero herede de una clase Juego"
        exam.push(TrueOrFalse.new(:qt => text, :r1 => false))
        
        expect(exam.to_s).to match(/(\d+-(.|\s|\n)+)+/)
      end
		end
	end
end
