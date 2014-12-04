require './requires'

class Yasp

	def self.code(&block)
		yasperator = YaspTree.new
		yasperator.instance_eval(&block)
		parse(yasperator)
	end

	def self.parse(yasperator)
		puts yasperator.tree.collect(&:s).join
	end
end


#example

Yasp.code do
	[[1,5],[3,3],[5,1]].each do |i|
		cylinder(i.first,i.last)
	end
end
