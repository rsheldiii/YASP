require_relative 'requires'

class Yasp

	#putses
	def self.puts(&block)
		puts compile(parse(&block))
	end

	#outputs to file
	def self.file(filename,&block)
		file = File.open(filename,"w+")
		file.write(compile(parse(&block)))
		file.close
	end

	private

	#interprets the code into symbols -- commands, because Symbol is already a class
	def self.parse(&block)
		yasperator = YaspTree.new
		yasperator.instance_eval(&block)
		yasperator
	end

	#compiles all symbols into their text representation in the correct order
	def self.compile(yasperator)
		yasperator.walk
	end
end
