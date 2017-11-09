class YaspDirective
  attr_accessor :tree, :opts, :args, :label

	def initialize(command = 'union', *args, &block)
		@children = []

    @label = command

    if (args.last.is_a?(Hash))
      puts "omg hash"
      puts args.inspect
      @args = args[0...-1]
      puts @args
      @opts = args.last
    else
      @args = args
      @opts = {}
    end

    instance_eval(&block) if block_given?
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

	def parse_args
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

	def to_scad(depth = 0)
		"#{indent(depth)}#{@label}(#{parse_args})#{parse_nested_children(depth+1)};\n"
	end

	def add(directive)
    @children << directive
  end

	def method_missing(m, *args, &block)
    directive = YaspDirective.new(m, *args, &block)
    add(directive)

    # return directive for chaining
    directive
	end
end
