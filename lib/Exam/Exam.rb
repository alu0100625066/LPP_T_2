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


end


