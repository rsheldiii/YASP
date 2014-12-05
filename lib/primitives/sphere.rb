class Sphere < Command
	def initialize(r,options={})
		super(options)
		@r = r
	end

	def opts
		super.merge({
			"r" => @r,
			"$fn" => 24
		})
	end
end
