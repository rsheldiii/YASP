class Translate < Command

	def initialize(position,opts={})
		super(opts)
		@position=position
	end

	def opts
		super.merge({
			"v" => @position
			})
	end
	
end