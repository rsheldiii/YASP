require_relative 'YASP/command'
require_relative 'YASP/yasp_tree'

class Yasp

	def self.yell(&block)
		puts stringify(&block)
	end

	#outputs to file
	def self.file(filename, &block)
		file = File.open(filename,"w+")
		file.write(stringify(&block))
		file.close
	end

	#compiles all symbols into their text representation in the correct order
	def self.stringify(&block)
		parse(block).to_scad
	end

	private

	#interprets the code into symbols -- commands, because Symbol is already a class
	def self.parse(block)
		YaspTree.new(block)
	end
end
