require "bundler/gem_tasks"

task :default => :spec

desc "Ejecutar código RSpec"
task :spec do
	sh "rspec -I. -Ilib -Ispec spec/Question_spec.rb"
end

desc "Ejecutar pruebas spec y volcar el resultado en un fichero html"
task :html do
	sh "rspec -I. -Ilib -Ispec spec/Question_spec.rb --format html > doc/test/index.html"
end

desc "Ejecutar pruebas spec y volcar el resultado en un fichero de texto"
task :doc do
	sh "rspec -I. -Ilib -Ispec spec/Question_spec.rb --format documentation"
end
