# coding: utf-8
require 'Question'

class Exam

	attr_accessor :head, :tail

	Node = Struct.new :value, :next
	
	def initialize (o)
		raise TypeError, "Se esperaba que se pasara una pregunta como parámetro" unless o.instance_of? (Question)
		@head = Node.new(o, nil)
		@tail = @head
	end

	def pop		 
		aux = @head
		@head = @head.next
		aux.next = nil
		aux.value	    
	end
	
	def push (*input)
		input.each do |x| 
			aux = Node.new(x, nil)
			@tail.next = aux
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
			s += "#{i}) #{aux.value.to_s}\n"
			aux = aux.next
			i += 1
		end
		s
	end

end


