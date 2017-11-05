class Command

	def initialize(name, args)
		@label = name

		if (args.last.is_a?(Hash))
			@args = args[0...-1]
			@opts = args.last
		else
			@args = args
			@opts = {}
		end

		@children = []
	end

	def <<(child)#TODO deferral mixin
		#TODO what the hell does 'deferral mixin' mean? why was I so bad at coments?
		@children << child
	end

	def opts
		@opts
	end

	def label
		@label
	end

	def argstring
		@args.map(&:inspect).join(", ").chomp(", ")
	end

	def optstring
		@opts.map { |key, value| "#{key}=#{value.inspect}"}.join(", ").chomp(", ")
	end

	def indent(depth)
		"  "*depth
	end

	def parse_arguments
		if @opts.empty?
			argstring
		elsif @args.empty?
			optstring
		else
			"#{argstring}, #{optstring}"
		end
	end

	def parse_children(depth)
		@children.map{ |c| c.to_scad(depth) }.join()
	end

	def parse_nested_children(depth)
		unless @children.empty?
			"{\n#{parse_children(depth)}#{indent(depth-1)}}"
		end
	end

	def to_scad(depth)
		if label
			"#{indent(depth)}#{label}(#{parse_arguments})#{parse_nested_children(depth+1)};\n"
		else
			parse_children(depth)
		end
	end
end
