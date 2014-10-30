# coding: utf-8
require 'Question'

class Exam

	attr_accesor :head, :tail

	Node = struct.new :value, :next
	
	def initialize (o)
		@head = Node.new(o, nil)
		@tail = @head
	end
end
