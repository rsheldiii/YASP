class Sphere < Shape
	def initialize(r,options={})
		super(options)
		@r = r
	end

	def opts
		super.merge({
			"radius" => @r,
			"$fn" => 24
		})
	end

	def label
		"sphere"
	end
end
