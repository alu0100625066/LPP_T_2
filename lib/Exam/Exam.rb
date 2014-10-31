# coding: utf-8
require 'Question'

class Exam

	attr_accesor :head, :tail

	Node = struct.new :value, :next
	
	def initialize (o)
		raise TypeError, "Se esperaba que se pasara una pregunta como parámetro" unless o.instance_of? (Question)
		@head = Node.new(o, nil)
		@tail = @head
	end

	 def pop		# modulo para poder sacar la pregunta 
	    hd = @head		#hd =head
	    @head = @head.next
	    hd.next = nil
	    hd.value
	  end

	  def <<(0)    
	     raise TypeError, "Esperando la pregunta para su inserción" unless o.instance_of? (Pregunta) 
	     @tail.next = Nodo.new(o, nil)
	     @tail = @tail.next    
	     @tail.value
	  end

	def push_back(*questions)  #puede contener una cantidad variable de argumentos
	    questions.each do |o|	#es un array, pero en ruby
	      @tail.next = Nodo.new(o, nil)
	      @tail = @tail.next
	      @total += 1
	    end
	    questions
	  end

	   def to_s
	    aux = @tail
	    s = ''
	    while (aux != nil) do
	      s += "#{i}.-) #{aux.value.to_s}\n"      
	      aux = aux.next
	    end
	    s
	  end 

	end
	
	

end


