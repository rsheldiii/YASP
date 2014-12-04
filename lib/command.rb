class Command

	def initialize
	end

	def opts
		raise NotImplementedError
	end

	def label
		raise NotImplementedError
	end

	def has_block?
		raise NotImplementedError
	end

	def s
		string  = label 
		string += "("
		string += opts.map { |key, value| "#{key} = #{value}"}.join(", ").chomp(", ")
		string +=	")"
		if has_block?
			string += "{\n"
		else
			string += ";\n"
		end
	end

	def close_block
		"};\n"
	end
end