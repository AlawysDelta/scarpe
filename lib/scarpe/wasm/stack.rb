# frozen_string_literal: true

class Scarpe
<<<<<<< HEAD
  class WASMStack < Scarpe::WASMWidget
    include Scarpe::WASMBackground
    include Scarpe::WASMBorder
    include Scarpe::WASMSpacing

    def initialize(properties)
      super
    end

    def element(&block)
      HTML.render do |h|
        h.div(id: html_id, style: style, &block)
      end
    end

=======
  class WASMStack < Scarpe::WASMSlot
>>>>>>> c1fdce9 (merged new commits from original)
    def get_style
      style
    end

<<<<<<< HEAD
    private
=======
    protected
>>>>>>> c1fdce9 (merged new commits from original)

    def style
      styles = super

      styles[:display] = "flex"
      styles["flex-direction"] = "column"
<<<<<<< HEAD
      styles[:width] = Dimensions.length(@width) if @width
      styles[:height] = Dimensions.length(@height) if @height
=======
      styles["align-content"] = "flex-start"
      styles["justify-content"] = "flex-start"
      styles["align-items"] = "flex-start"
>>>>>>> c1fdce9 (merged new commits from original)
      styles["overflow"] = "auto" if @scroll

      styles
    end
  end
end
