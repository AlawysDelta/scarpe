# frozen_string_literal: true

require "js"

class Scarpe
  class WASMInterops
    def bind(name, func = nil, &block)
      JS.global[:self][name.to_sym] = (func ? func : block)
      defined?(JS.global[:self][name.to_sym])
    end

    def eval(command)
      JS.eval(command)
    end

    def init(command)
      JS.eval(command)
    end

    def set_title(title)
      JS.global[:document][:title] = title
    end

    def set_size(width, height, hint)
      JS.global[:document][:body][:style][:width] = width
      JS.global[:document][:body][:style][:height] = height
    end

    def navigate(string)
      # stub
    end

    def run
      # stub
    end

    def destroy
      # stub
    end
  end
end
