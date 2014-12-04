class RegularPrism < Cylinder
	def initialize(chord,height,sides,options={})
		super(chord,height,options)
		@sides = sides
	end

	def opts
		super.merge({
			"$fn" => @sides
		})
	end
end
