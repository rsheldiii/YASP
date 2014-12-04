class YaspTree
	
	attr_accessor :tree

	def initialize
		@tree = []
	end

	def add(obj)
		@tree << obj
	end

	def cube(x,opt={})
		add(Cube.new(x,opt))
	end

	def rprism(x,y,z,opt={})
		add(RPrism.new(x,y,x,opt))
	end

	def sphere(r,opt={})
		add(Sphere.new(r,opt))
	end

	def regular_prism(chord,height,sides,opt={})
		add(RegularPrism.new(chord,height,sides,opt))
	end

	def cylinder(r,h,opt={})
		add(Cylinder.new(r,h,opt))
	end

	#methody things

	def union(*args)
	end

	def minkowski(*args)
	end

	def translate(x,y,z, &block)
		add(TranslateIn.new([x,y,z]))
	  block.call
	  add(TranslateOut.new)
	end

	def rotate(x,y,z,&block)
	end
end
