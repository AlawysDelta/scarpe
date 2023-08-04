# frozen_string_literal: true

class Scarpe
  module WASMBorder
    def style
      styles = (super if defined?(super)) || {}
      return styles unless @border_color

<<<<<<< HEAD
      border_color = if @border_color.is_a?(Range)
        { "border-image": "linear-gradient(45deg, #{@border_color.first}, #{@border_color.last}) 1" }
      else
        { "border-color": @border_color }
      end

=======
      border_color = case @border_color
      when Range
        { "border-image": "linear-gradient(45deg, #{@border_color.first}, #{@border_color.last})" }
      when Array
        { "border-color": "rgba(#{@border_color.join(", ")})" }
      else
        { "border-color": @border_color }
      end
>>>>>>> c1fdce9 (merged new commits from original)
      styles.merge(
        "border-style": "solid",
        "border-width": "#{@options[:strokewidth] || 1}px",
        "border-radius": "#{@options[:curve] || 0}px",
      ).merge(border_color)
    end
  end
end
