# frozen_string_literal: true

class Scarpe
  class WASMEditBox < Scarpe::WASMWidget
    include Scarpe::Log
    attr_reader :text, :height, :width

    def initialize(properties)
      log_init("ScarpeEditBox")
      @log.debug("Initializing edit box")
      super

      # The JS handler sends a "change" event, which we forward to the Shoes widget tree
      bind("change") do |new_text|
        send_self_event(new_text, event_name: "change")
      end
    end

    def properties_changed(changes)
      @log.debug("Entered properties_changed with changes: #{changes}")
      t = changes.delete("text")
      if t
        html_element.value = t
      end

      super
    end

    def element
      @log.debug("Entering element")
      oninput = handler_js_code("change", "this.value")

      HTML.render do |h|
        h.textarea(id: html_id, oninput: oninput, style: style) { text }
      end
    end

    private

    def style
      styles = {}

      styles[:height] = Dimensions.length(height)
      styles[:width] = Dimensions.length(width)

      styles.compact
    end
  end
end
