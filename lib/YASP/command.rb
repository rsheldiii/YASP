# frozen_string_literal: true

class Command

  attr_reader :opts, :label

  def initialize(name, args)
	@label = name
    @children = []

	if (args.last.is_a?(Hash))
	  @args = args[0...-1]
	  @opts = args.last
	else
	  @args = args
	  @opts = {}
	end
  end

  def <<(child)#TODO deferral mixin
	#TODO what the hell does 'deferral mixin' mean? why was I so bad at coments?
    # I would like to know this too - Alx3Dev :)
	@children << child
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
	"{\n#{parse_children(depth)}#{indent(depth-1)}}" unless @children.empty?
  end

  def to_scad(depth)
	unless @label.empty?
	  "#{indent(depth)}#{label}(#{parse_arguments})#{parse_nested_children(depth+1)};\n"
	else
	  parse_children(depth)
	end
  end
end
