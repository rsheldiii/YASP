class RPrism < Shape

	def initialize(x,y,z,options={})
		super(options)
		@position = [x,y,z]
	end

	def opts
		super.merge({
			"center" => true,
			"size" => @position
		})
	end

	def label
		"cube"
	end

end
