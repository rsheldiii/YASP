# frozen_string_literal: true

require_relative 'yasp_class'


class YaspBlock < YaspClass

  def initialize(block)
	  super()
	  instance_eval(&block)
  end

end
