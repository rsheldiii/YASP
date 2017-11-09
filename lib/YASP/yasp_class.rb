class YaspClass
  attr_accessor :tree

	def initialize
		@tree = Command.new('union', [])
	end

	def add(obj)
    @tree << obj.tree if obj.is_a?(YaspClass)
	  @tree << obj if obj.is_a?(Command)
	end

	def to_scad
		@tree.to_scad(0);
	end

	def method_missing(m, *args, &block)
		element = Command.new(m, args)
		add(element)

		if block_given?
			previous_head = @tree
			@tree = element
			self.instance_eval(&block)
			@tree = previous_head
		end
	end
end
