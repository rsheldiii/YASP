class Command

	def initialize(options={})
		@children = []
		@opts = options
	end

	def <<(child)#TODO deferral mixin
		@children << child
	end

	def opts
		@opts
	end

	def label
		self.class.to_s.downcase
	end

	def s
		string  = label 
		string += "("
		string += opts.map { |key, value| "#{key} = #{value}"}.join(", ").chomp(", ")
		string +=	")"
		if !@children.empty?
			string += "{\n"
			string += @children.map(&:s).join
			string += "}\n"
		else
			string += ";\n"
		end
	end
end