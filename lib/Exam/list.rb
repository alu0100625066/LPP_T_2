# coding: utf-8
require 'question'
require 'trueorfalse'

#nodos
Node = Struct.new :value, :next, :prev


#Clase para las listas doblemente enlazadas
class List

	attr_accessor :head, :tail

	include Enumerable 	

#Inicializacion de una instancia de la clase Lista a partir de una Question pregunta).
	def initialize (o)
		raise TypeError, "Se esperaba que se pasara una pregunta como parámetro" unless o.instance_of? (Question)
		@head = Node.new(o, nil,nil)
		@tail = @head
	end


#Metodo para extraer "por la cabeza" de la lista acutalmente.
	def pop
		raise IndexError, "La lista se encuentra vacía" unless @head.is_a? (Node)		
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


#Metodo	para instertar varias preguntas sucesivamente
	def push (*input)
		input.each do |x| 
			aux = Node.new(x, nil, nil)
			@tail.next = aux
			aux.prev = @tail	
			@tail = @tail.next
			@tail.value
		end
		input
	end


#Metodo to_s
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



#Metodo para le manejo de metodos del modulo Enumerable
	def each 		
		aux =@head	
		while (aux != nil) do
			yield aux.value 
			aux = aux.next
		end
	end
	


#Metodo que devuelve la lista actual invertida.
	def inverter (&block)
		block = ->(x) {true} if !block_given?
		list = invert(@head, &block)
		list.pop
		return nil  if list.count == 0
		list
	end


#Metodo auxiliar que se utiliza para invertir la lista (recursividad).	
	def invert(actual, &block)
		return List.new(Question.new(:qt => "dummy", :r1 => "dummy", :wrong => ["dummy"])) if (actual == nil)
		list = invert(actual.next, &block)
		list.push(actual.value) if block[actual.value]
		list
	end
	
	private :invert

end


