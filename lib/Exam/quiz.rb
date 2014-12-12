#coding: utf-8
require 'examen'
class Quiz
	
	attr_accessor :name, :counter, :exam
	
	def initialize(name, &block)
		@name = name
		@exam = Exam.new(Question.new(:qt => "-", :r1 => "-", :wrong => ["-"]))
		@exam.exam.pop
		@counter = 0
		instance_eval &block
	end

	def right
		:right
	end
	
	def wrong
		@counter += 1
		[:wrong, @counter]
	end
	
	def question(*args)
		wrong = Array.new
		args[1].keys.each { |x| wrong << args[1][x] if x.instance_of?(Array)}
		@exam.push(Question.new(:qt => args[0], :r1 => args[1][:right], :wrong => wrong))
		@exam
	end
	
	def to_s
		"\t#{@name}\n\n#{@exam}"
	end
	
	def run
		puts "#{@name}"
		punt = 0
		right = @exam.right
		userans = Array.new(right.count, false)
		@exam.exam.each_with_index do |x, i|
			 puts x
			 print "Su respuesta es: "
			 STDOUT.flush
			 if right[i].to_s.eql?gets.chomp
			 		punt += 1
			 end
			 puts "\n"
		end
		puts "Ha acertado #{punt} de #{right.count}" 
	end
	
end
