# frozen_string_literal: true

class Scarpe
<<<<<<< HEAD
  class WASMFlow < Scarpe::WASMWidget
    include Scarpe::WASMBackground
    include Scarpe::WASMBorder

=======
  class WASMFlow < Scarpe::WASMSlot
>>>>>>> c1fdce9 (merged new commits from original)
    def initialize(properties)
      super
    end

<<<<<<< HEAD
    def element(&block)
      HTML.render do |h|
        h.div(id: html_id, style:, &block)
      end
    end

    private
=======
    protected
>>>>>>> c1fdce9 (merged new commits from original)

    def style
      styles = super

      styles[:display] = "flex"
      styles["flex-direction"] = "row"
      styles["flex-wrap"] = "wrap"
<<<<<<< HEAD
      styles[:width] = Dimensions.length(@width) if @width
      styles[:height] = Dimensions.length(@height) if @height
=======
      styles["align-content"] = "flex-start"
      styles["justify-content"] = "flex-start"
      styles["align-items"] = "flex-start"
>>>>>>> c1fdce9 (merged new commits from original)

      styles
    end
  end
end
