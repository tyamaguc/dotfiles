require 'rubygems' if RUBY_VERSION < '1.9'
require 'awesome_print'

Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'
Pry.commands.alias_command 'f', 'finish'

Pry.print = proc{|output,value| output.puts value.ai }