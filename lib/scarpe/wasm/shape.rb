# frozen_string_literal: true

require_relative "shape_helper"

class Scarpe
  class WASMShape < Scarpe::WASMWidget
    include ShapeHelper

    def initialize(properties)
      super(properties)
    end

    def element(&block)
      HTML.render do |h|
        h.div(id: html_id, style: style) do
          h.svg(width: "400", height: "500") do
            h.path(d: shape_path, style: "stroke:#{stroke_color};stroke-width:2")
          end
          block.call(h) if block_given?
        end
      end
    end

    private

    def style
      {
        width: "400",
        height: "900",
      }
    end

    def stroke_color
      "black"
    end
  end
end
