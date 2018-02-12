require_relative 'YASP/command'
require_relative 'YASP/yasp_block'

class Yasp

	def self.yell(&block)
		puts stringify(&block)
	end

	#outputs block to file
	def self.file(filename, &block)
		file = File.open(filename,"w+")
		file.write(stringify(&block))
		file.close
	end

	#compiles all Commands into their text representation in the correct order
	def self.stringify(&block)
		parse(block).to_scad
	end

	#interprets a block into a tree of Commands, which can be walked to create openSCAD code
	def self.parse(block = nil, &given_block)
		if block_given?
			YaspBlock.new(given_block)
		elsif block
			YaspBlock.new(block)
		end
	end
end
