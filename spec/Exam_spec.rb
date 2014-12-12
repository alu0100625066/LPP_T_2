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
			
			it ":Debe existir un grado de dificultad por defecto" do
				expect(@q.difficulty)== 1
			end
			
			it ":Debe permitir dar valor a la dificultad" do
				a = Question.new(:qt => '1+1=', :r1 => 2, :wrong => [3,5,7], :difficulty => 3)
				expect(a.difficulty).to eq(3)			
			end
			
			it ":Se debe invocar un método para obtener la dificultad" do
				expect(@q).to respond_to :difficulty
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
			
			it ":Se pueden comparar las preguntas" do
				p = Question.new(:qt => "1+2=", :r1 => 3, :wrong => [1, 2, 4], :difficulty => 2)
				expect(@q<p).to eq(true)
				expect(@q>p).to eq(false)
				expect(@q<=p).to eq(true)
				expect(@q>=p).to eq(false)
				expect(@q==p).to eq(false)
			end
			
			it ":Debe existir el módulo Comparable" do
				expect(@q).to be_kind_of (Comparable)
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
		
			it "*Debe ser una instancia de la clase Question" do
				expect(@q).instance_of? (Question)
			end
		
			it "*Debe existir una pregunta" do
				expect(@q.qt)== '¿Es verdad que 2+2=4 ?'
			end
			
			it "*Deben existir opciones de respuesta" do
				expect(@q.r1)== "Cierto"
				expect(@q.wrong)== "Falso"
			end
			
			it "*Debe existir un grado de dificultad por defecto" do
				expect(@q.difficulty)== 1
			end
			
			it "*Debe permitir dar valor a la dificultad" do
				a = TrueOrFalse.new(:qt => '1+1=', :r1 => 2, :wrong => [3,5,7], :difficulty => 3)
				expect(a.difficulty).to eq(3)			
			end
			
			it "*Se debe invocar un método para obtener la dificultad" do
				expect(@q).to respond_to :difficulty
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
			
			it "*Debe existir el módulo Comparable" do
				expect(@q).to be_kind_of (Comparable)
			end
			
			it "*Se pueden comparar las preguntas" do
				p = TrueOrFalse.new(:qt => "¿1+2=3?", :r1 => true, :difficulty => 2)
				expect(@q<p).to eq(true)
				expect(@q>p).to eq(false)
				expect(@q<=p).to eq(true)
				expect(@q>=p).to eq(false)
				expect(@q==p).to eq(false)
			end
			
		end
	end
end
	
class List
	describe Exam do
		
		before :each do
			@q = Question.new(:qt => '2+2=', :r1 => 4, :wrong => [2,5,8])
			@n = Node.new (@q)
			@l = List.new(@q)
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
				expect(@l).to respond_to :pop
				expect(@l.pop)==@q
			end
			
			it "#Se puede insertar un elemento" do
				a = @q
				expect(@l).to respond_to :push
				expect(@l.push(a))==a
			end
			
			it "#Se pueden insertar varios elementos" do
				a = [@q, @q, @q]
				expect(@l).to respond_to :push
				expect(@l.push(a))==a
			end
			
			it "#Debe existir una Lista con su cabeza" do
				expect(@l).to respond_to :head
			end
			
			it "#Debe mostrarse correctamente" do
      	text = "\n¿Cuál es la salida del siguiente código Ruby?\nclass Xyz\n\sdef pots\n\s\s@nice\n\send\nend\n\nxyz = Xyz.new\np xyz.pots"
        list = List.new(Question.new(:qt => text, :r1 =>"nil", :wrong => ["#<Xyz:0xa000208>","0","Ninguna de las anteriores"]))

        text = "La siguiente definición de un hash en Ruby es válida:\nhash_raro = {\n\s[1, 2, 3] => Object.new(),\nHash.new => :toto\n}"
        list.push(TrueOrFalse.new(:qt => text, :r1 => false))

        text = %Q{¿Cuál es la salida del siguiente código Ruby?\nclass Array\n\sdef say_hi\n\s\s"HEY!"\n\send\nend\n p [1, "bob"].say_hi}
        list.push(Question.new(:qt => text, :r1 =>"HEY!", :wrong => ["1","bob","Ninguna de las anteriores"]))
   
        text = "¿Cuál es el tipo del objeto en el siguiente código Ruby?\nclass Objeto\nend"
        list.push(Question.new(:qt => text, :r1 =>"Una instancia de la clase Class", :wrong => ["Una Constante", "Un Objeto", "Ninguna de las anteriores"]))
   
        text = "Es apropiado que una clase Tablero herede de una clase Juego"
        list.push(TrueOrFalse.new(:qt => text, :r1 => false))
        
        expect(list.to_s).to match(/(\d+-(.|\s|\n)+)+/)
			end
       
			it "#Debe existir el modulo Enumerable" do
				expect(@l).to be_kind_of (Enumerable)
			end

			it "#Debe poder ordenarse" do
        a = TrueOrFalse.new(:qt => "Es apropiado que una clase Tablero herede de una clase Juego", :r1 => false, :difficulty => 0)
        @l.push(a)
				expect(@l.sort).to eq([a, @q])
			end
			
			it "#Debe conocer el nodo de mayor dificultad" do
				p = TrueOrFalse.new(:qt => "¿1+2=3?", :r1 => true, :difficulty => 2)
				@l.push(p)
				expect(@l.max).to eq(p)
			end
			
			it "#Debe conocer el nodo de menor dificultad" do
				p = TrueOrFalse.new(:qt => "¿1+2=3?", :r1 => true, :difficulty => 2)
				@l.push(p)
				expect(@l.min).to eq(@q)
			end
			
			it "#Debe poder usarse all?" do
				p = TrueOrFalse.new(:qt => "¿1+2=3?", :r1 => true, :difficulty => 2)
				@l.push(p)
				expect(@l.all?{|x| x.difficulty >= 1}).to eq(true)  
			end
       
      it "#Debe poder usar any?" do
      	p = TrueOrFalse.new(:qt => "¿1+2=3?", :r1 => true, :difficulty => 2)
      	@l.push(p)
      	expect(@l.any?{|x| x.difficulty <= 0}).to eq(false)
      end
      
      it "#Debe poder contar las repeticiones de un mismo nodo" do
      	p = TrueOrFalse.new(:qt => "¿1+2=3?", :r1 => true, :difficulty => 2)
      	@l.push(p)
      	expect(@l.count(p))==1
      end
      
      it "#Debe tener un método inverter" do
      	expect(@l).to respond_to :inverter
      end
      
      it "#Debe tener un método invert que sea privado" do
      	expect(@l.private_methods.include? :invert).to eq(true)
      end
      
   		it "#Debe ser capaz de invertir la lista" do
   			a = Question.new(:qt => '1+2=', :r1 => 3, :wrong => [2,5,8], :difficulty => 2)
   			@l.push(a)
   			expect(@l.inverter.pop).to eq(a)
   			expect(@l.inverter {false}).to eq(nil)
   			expect((@l.inverter {|p| p.difficulty == 2}).pop).to eq(a)
   			listaAux = @l.inverter {|p| p.difficulty == 2}
   			listaAux.pop
   			expect(listaAux.head == nil).to eq(true)
   		end
		end
  end
end

class Exam
	describe Exam do
		
		before :each do
			@q = Question.new(:qt => '2+2=', :r1 => 4, :wrong => [2,5,8])
			@e = Exam.new(@q)
    end

		context "Exam" do		
     	
     	it "-Debe tener un atributo lista" do
     		expect(@e).to respond_to :exam
     	end
     	
     	it "-Debe mostrar por pantalla el examen" do
     		expect(@e).to respond_to :to_s
     	end
     	
     	it "-Debe mostrarse correctamente el examen" do
     		expect(@e.to_s).to match(/(\d+-(.|\s|\n)+)+/)
     	end
      	
     	it "-Se puede insertar uno o varios elementos" do
     		expect(@e).to respond_to :push
     	end
     	
     	it "-Debe tener un método que gestione las respuesta correctas" do
     		expect(@e).to respond_to :right
     	end	
     		
     	it "-Debe tener un método que devuelva un array con las respuestas correctas" do
     		@e.push(@q)
     		x = @e.right
     		expect(x[0])==@q.r1
     		expect(x[1])==@q.r1
     	end     	
		end
	end
end

class Examui
	describe Exam do
	
		before :each do
			@q = Question.new(:qt => '2+2=', :r1 => 4, :wrong => [2,5,8])
			@u = Examui.new(@q)
		end
	
		context "Exam" do
		
			it "~Debe tener un atributo del tipo examen" do
				expect(@u).to respond_to :examui
			end
			
			it "~Debe tener un método para comprobar si las respuestas dadas por el usuario son correctas" do
				expect(@u).to respond_to :compare
			end
			
			it "~El método debe poder comparar una o más respuetas" do
				@u.examui.push(@q)
				res = [4, 4]
				comp = @u.compare(res)
				expect(comp[0])==true
				expect(comp[1])==true
			end
		
		end		
	end
end


class Quiz
	describe Quiz do
	
		before :each do
			@q = Quiz.new("Cuestionario LPP 05/12/2014") do
							question "¿Cuantos argumentos de tipo bloque puede recibir un metodo?",
							right => "1",
							wrong => "2",
							wrong => "muchos",
							wrong => "los que defina el usuario"
			
							question "En Ruby los bloques son objetos que contienen codigo",
							wrong => "Cierto",
							right => "Falso"
			end
		end
	
		context "Quiz" do
		
			it "~Debe tener un atributo del tipo examen" do
				expect(@q).to respond_to :exam
				expect(@q.exam.instance_of?Exam).to eq(true)
			end
			
			it "~Debe tener un nombre para el examen" do
				expect(@q).to respond_to :name
				expect(@q.name)=="Cuestionario LPP 05/12/2014"
			end 
			
			it "~Debe tener una variable de clase que usaremos de contador" do
				expect(@q).to respond_to :counter
				expect(@q.counter)==2
			end 
			
			it "~Debe tener un método right" do
				expect(@q).to respond_to :right
			end 
			
			it "~Debe tener un método wrong" do
				expect(@q).to respond_to :wrong
			end 
			
			it "~Debe tener un método question" do
				expect(@q).to respond_to :question
			end 
			
			it "~Debe tener un método to_s" do
				expect(@q).to respond_to :to_s
			end 
			
			it "~Debe tener un método run" do
				expect(@q).to respond_to :run
			end 
			
			it "~El método right debe devolver un símbolo" do
				expect(@q.right.instance_of?Symbol).to eq(true) 
			end			
			
			it "~El método wrong debe devolver un array" do
				expect(@q.wrong.instance_of?Array).to eq(true) 
			end			
			
			it "~El método question debe leer preguntas" do
				expect(@q.question("3+4=", @q.right => "7", @q.wrong => "1")).to be_instance_of(Exam)
			end			
					
		end		
	end
end
