class Shape < Command
	
	def initialize(options)
		@opts = options
	end

	def label
		raise NotImplementedError
	end

	def opts
		@opts
	end

	def has_block?
		false
	end

	#s is in command!
end
