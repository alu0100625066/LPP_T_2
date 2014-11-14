# coding: utf-8
require 'Question'
require 'TrueOrFalse'

Node = Struct.new :value, :next, :prev

class Exam

	attr_accessor :head, :tail

 include Enumerable 	## Instancias enumerables 

	def initialize (o)
		raise TypeError, "Se esperaba que se pasara una pregunta como parámetro" unless o.instance_of? (Question)
		@head = Node.new(o, nil,nil)
		@tail = @head
	end

	def pop	# metodo a modificar para la lista doblemente enlazada	 
		rise IndexError, "La lista se encuentra vacía" unless @head.is_a? (Node)		
		aux = @head

		if (@head == @tail)
			@head = @tail = nil
			aux.next = aux.prev = nil
		else	 
			@head = @head.next
			@head.prev = nil		
			aux.next = aux.prev = nil
		end 

		aux.value	 	    
	end
	
	def push (*input)
		input.each do |x| 
			aux = Node.new(x, nil, nil)
			@tail.next = aux
			aux.prev = @tail	#en la cola el nodo siguiente y el previo son el mismo
			@tail = @tail.next
			@tail.value
		end
		input
	end
	
	def to_s
		aux = @head
		s = ' '
		i = 1
		while (aux != nil) do
			s += "#{i}) #{aux.value}\n"
			aux = aux.next
			i += 1
		end
		s
	end

def each 		# metodo del <include Enumerable>
aux =@head   		#devuelve el "enumerador" instanciado, 
			#recorremos todos los nodos
while (aux !=null) do
yield aux.value 	#metodo que llama al bloque <value>
aux = aux.next
end


end


