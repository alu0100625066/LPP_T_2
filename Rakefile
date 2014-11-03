require "bundler/gem_tasks"
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

task :default => :spec

desc "Ejecutar pruebas spec y volcar el resultado en un fichero html"
task :html do
	sh "rspec -I. -Ilib -Ilib/Exam -Ispec spec/Exam_spec.rb --format html > doc/test/index.html"
        sh "firefox doc/test/index.html"
end

desc "Ejecutar pruebas spec y volcar el resultado en un fichero de texto"
task :doc do
	sh "rspec -I. -Ilib -Ilib/Exam -Ispec spec/Exam_spec.rb --format documentation"
end
