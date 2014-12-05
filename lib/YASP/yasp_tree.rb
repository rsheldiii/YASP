class YaspTree

	def initialize 
		@head = Union.new
		puts @head
	end

	def add(obj)
		@head << obj
	end

	def walk
		@head.s
	end

	#objecty things

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

	def minkowski(&block)
		process_block_command(Minkowski.new,&block)
	end

	def translate(x,y,z, &block)
		process_block_command(Translate.new([x,y,z]),&block)
	end

	def process_block_command(element,&block)
		add(element)
		
		oldhead = @head
		@head = element

		self.instance_eval(&block)

		@head = oldhead
	end

	def rotate(x,y,z,&block)
	end
end
