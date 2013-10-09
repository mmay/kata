# use_grammar.rb
require 'rubygems'
require 'treetop'
# require 'polyglot'

Treetop.load 'calculator_grammar'
# or just:
# require 'calculator_grammar'                     # This works because Polyglot hooks "require" to find and load Treetop files

parser = CalculatorGrammarParser.new
puts parser.parse('11+1').elements.map {|stuff| puts stuff.text_value}
puts parser.parse('23*5').elements.map {|stuff| puts stuff.text_value}
puts parser.parse('40/8').elements.map {|stuff| puts stuff.text_value}
puts parser.parse('7.5-2.32').elements.map {|stuff| puts stuff.text_value}

# puts parser.parse('hello lambek')         # => Treetop::Runtime::SyntaxNode
# puts parser.index
