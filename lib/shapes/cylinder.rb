class Cylinder < Shape
	def initialize(r,h,options={})#TODO the rest of the variables
		super(options)
		@r = r
		@h = h
	end

	def opts
		super.merge({
			"r" => @r,
			"h" => @h,
			"$fn" => 12
		})
	end

	def label
		"cylinder"
	end
end