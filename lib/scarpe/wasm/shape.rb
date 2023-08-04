# frozen_string_literal: true

<<<<<<< HEAD
require_relative "shape_helper"

class Scarpe
  class WASMShape < Scarpe::WASMWidget
    include ShapeHelper

=======
class Scarpe
  # Should inherit from Slot?
  class WASMShape < Scarpe::WASMWidget
>>>>>>> c1fdce9 (merged new commits from original)
    def initialize(properties)
      super(properties)
    end

<<<<<<< HEAD
    def element(&block)
      HTML.render do |h|
        h.div(id: html_id, style: style) do
          h.svg(width: "400", height: "500") do
            h.path(d: shape_path, style: "stroke:#{stroke_color};stroke-width:2")
=======
    def to_html
      @children ||= []
      child_markup = @children.map(&:to_html).join

      color = @draw_context["fill"] || "black"
      self_markup = HTML.render do |h|
        h.div(id: html_id, style: style) do
          h.svg(width: "400", height: "500") do
            h.path(d: path_from_shape_commands, style: "fill:#{color};stroke-width:2;")
          end
        end
      end

      # Put child markup first for backward compatibility, but I'm pretty sure this is wrong.
      child_markup + self_markup
    end

    def element(&block)
      color = @draw_context["fill"] || "black"
      HTML.render do |h|
        h.div(id: html_id, style: style) do
          h.svg(width: "400", height: "500") do
            h.path(d: path_from_shape_commands, style: "fill:#{color};stroke-width:2;")
>>>>>>> c1fdce9 (merged new commits from original)
          end
          block.call(h) if block_given?
        end
      end
    end

    private

<<<<<<< HEAD
=======
    # We have a set of Shoes shape commands, but we need SVG objects like paths.
    def path_from_shape_commands
      current_path = ""

      @shape_commands.each do |cmd, *args|
        case cmd
        when "move_to"
          x, y = *args
          current_path += "M #{x} #{y} "
        when "line_to"
          x, y = *args
          current_path += "L #{x} #{y} "
        else
          raise "Unknown shape command! #{cmd.inspect}"
        end
      end

      current_path
    end

>>>>>>> c1fdce9 (merged new commits from original)
    def style
      {
        width: "400",
        height: "900",
      }
    end
<<<<<<< HEAD

    def stroke_color
      "black"
    end
=======
>>>>>>> c1fdce9 (merged new commits from original)
  end
end
