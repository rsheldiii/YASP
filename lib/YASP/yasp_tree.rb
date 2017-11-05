class YaspTree

	def initialize(block)
		@head = Command.new(nil, [])
		process(block)
	end

	def tree
		@head
	end

	def add(obj)
		@head << obj
	end

	def to_scad
		@head.to_scad(0);
	end

	def process(block)
		instance_eval(&block)
	end

	def assign(&block)
		YaspTree.new(block).tree
	end

	def method_missing(m, *args, &block)
		element = Command.new(m, args)
		add(element)

		if block_given?
			previous_head = @head
			@head = element

			self.instance_eval(&block)

			@head = previous_head
		end
	end
end
