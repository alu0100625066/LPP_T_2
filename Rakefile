require "bundler/gem_tasks"

task :default => :spec

desc "Ejecutar código RSpec"
task :spec do
	sh "rspec -I. -Ilib -Ispec spec/Question_spec.rb"
end
