# frozen_string_literal: true

<<<<<<< HEAD
class Scarpe
  module WASMBackground
=======
require "scarpe/base64"

class Scarpe
  module WASMBackground
    include Base64

>>>>>>> c1fdce9 (merged new commits from original)
    def style
      styles = (super if defined?(super)) || {}
      return styles unless @background_color

<<<<<<< HEAD
      color = if @background_color.is_a?(Range)
        "linear-gradient(45deg, #{@background_color.first}, #{@background_color.last})"
=======
      color = case @background_color
      when Array
        "rgba(#{@background_color.join(", ")})"
      when Range
        "linear-gradient(45deg, #{@background_color.first}, #{@background_color.last})"
      when ->(value) { File.exist?(value) }
        "url(data:image/png;base64,#{encode_file_to_base64(@background_color)})"
>>>>>>> c1fdce9 (merged new commits from original)
      else
        @background_color
      end

      styles.merge(background: color)
    end
  end
end
