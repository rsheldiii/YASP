require './requires'

class Yasp

	def self.print(&block)
		yasperator = YaspTree.new
		yasperator.instance_eval(&block)
		parse(yasperator)
	end

	def self.file(filename,&block)
		yasperator = YaspTree.new
		yasperator.instance_eval(&block)

		file = File.open(filename,"w+")
		file.write(parse(yasperator))
		file.close
	end

	def self.parse(yasperator)
		yasperator.walk
	end
end


#example

Yasp.file("./scad.scad") do
	#the power of YASP
	9.times do |x|
		7.times do |y|
			translate(x*3,y*4,0) do
				sphere(1)
			end
		end
	end

	#the power of GREYSKULL
	translate(3,4,5) do
		minkowski() do
			cube(4)
			sphere(3)
		end
	end
end
