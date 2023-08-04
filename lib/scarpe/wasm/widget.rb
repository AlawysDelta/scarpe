# frozen_string_literal: true

class Scarpe
<<<<<<< HEAD
  class WASMWidget < DisplayService::Linkable
    include Scarpe::Log

    class << self
      def display_class_for(scarpe_class_name)
        scarpe_class = Scarpe.const_get(scarpe_class_name)
        unless scarpe_class.ancestors.include?(Scarpe::DisplayService::Linkable)
          raise "Scarpe WASM can only get display classes for Scarpe " +
=======
  # The WASMWidget parent class helps connect a WASM widget with
  # its Shoes equivalent, render itself to the WASM DOM, handle
  # Javascript events and generally keep things working in WASM.
  class WASMWidget < Shoes::Linkable
    include Shoes::Log

    class << self
      # Return the corresponding WASM class for a particular Shoes class name
      def display_class_for(scarpe_class_name)
        scarpe_class = Shoes.const_get(scarpe_class_name)
        unless scarpe_class.ancestors.include?(Shoes::Linkable)
          raise "Scarpe WASM can only get display classes for Shoes " +
>>>>>>> c1fdce9 (merged new commits from original)
            "linkable widgets, not #{scarpe_class_name.inspect}!"
        end

        klass = Scarpe.const_get("WASM" + scarpe_class_name.split("::")[-1])
        if klass.nil?
          raise "Couldn't find corresponding Scarpe WASM class for #{scarpe_class_name.inspect}!"
        end

        klass
      end
    end

<<<<<<< HEAD
    attr_reader :shoes_linkable_id
    attr_reader :parent
=======
    # The Shoes ID corresponding to the Shoes widget for this WASM widget
    attr_reader :shoes_linkable_id

    # The WASMWidget parent of this widget
    attr_reader :parent

    # An array of WASMWidget children (possibly empty) of this widget
>>>>>>> c1fdce9 (merged new commits from original)
    attr_reader :children

    def initialize(properties)
      log_init("WASM::Widget")

      # Call method, which looks up the parent
      @shoes_linkable_id = properties["shoes_linkable_id"] || properties[:shoes_linkable_id]
      unless @shoes_linkable_id
        raise "Could not find property shoes_linkable_id in #{properties.inspect}!"
      end

      # Set the display properties
      properties.each do |k, v|
        next if k == "shoes_linkable_id"

        instance_variable_set("@" + k.to_s, v)
      end

      # The parent field is *almost* simple enough that a typed display property would handle it.
      bind_shoes_event(event_name: "parent", target: shoes_linkable_id) do |new_parent_id|
        display_parent = WASMDisplayService.instance.query_display_widget_for(new_parent_id)
        if @parent != display_parent
          set_parent(display_parent)
        end
      end

      # When Shoes widgets change properties, we get a change notification here
      bind_shoes_event(event_name: "prop_change", target: shoes_linkable_id) do |prop_changes|
        prop_changes.each do |k, v|
          instance_variable_set("@" + k, v)
        end
        properties_changed(prop_changes)
      end

      bind_shoes_event(event_name: "destroy", target: shoes_linkable_id) do
        destroy_self
      end

      super(linkable_id: @shoes_linkable_id)
    end

    # This exists to be overridden by children watching for changes
    def properties_changed(changes)
      needs_update! unless changes.empty?
    end

    def set_parent(new_parent)
      @parent&.remove_child(self)
      new_parent&.add_child(self)
      @parent = new_parent
    end

    protected

    # Do not call directly, use set_parent
    def remove_child(child)
      @children ||= []
      unless @children.include?(child)
        @log.error("remove_child: no such child(#{child.inspect}) for"\
          " parent(#{parent.inspect})!")
      end
      @children.delete(child)
    end

    # Do not call directly, use set_parent
    def add_child(child)
      @children ||= []
      @children << child
      @log.debug(child)
      # If we add a child, we should redraw ourselves
      needs_update!
    end

    # Convert an [r, g, b, a] array to an HTML hex color code
    # Arrays support alpha. HTML hex does not. So premultiply.
    def rgb_to_hex(color)
      return color if color.nil?

      r, g, b, a = *color
      if r.is_a?(Float)
        a ||= 1.0
        r_float = r * a
        g_float = g * a
        b_float = b * a
      else
        a ||= 255
        a_float = (a / 255.0)
        r_float = (r.to_f / 255.0) * a_float
        g_float = (g.to_f / 255.0) * a_float
        b_float = (b.to_f / 255.0) * a_float
      end

      r_int = (r_float * 255.0).to_i.clamp(0, 255)
      g_int = (g_float * 255.0).to_i.clamp(0, 255)
      b_int = (b_float * 255.0).to_i.clamp(0, 255)

      "#%0.2X%0.2X%0.2X" % [r_int, g_int, b_int]
    end

    public

<<<<<<< HEAD
    # This gets a mini-webview for just this element and its children, if any
=======
    # This gets a mini-WASM for just this element and its children, if any.
    # It is normally called by the widget itself to do its DOM management.
    #
    # @return [Scarpe::WebWrangler::ElementWrangler] a DOM object manager
>>>>>>> c1fdce9 (merged new commits from original)
    def html_element
      @elt_wrangler ||= WASMDisplayService.instance.doc_root.get_element_wrangler(html_id)
    end

    # Return a promise that guarantees all currently-requested changes have completed
    def promise_update
      html_element.promise_update
    end

    def html_id
      object_id.to_s
    end

    # to_html is intended to get the HTML DOM rendering of this object and its children.
<<<<<<< HEAD
    # Calling it should be side-effect-free and NOT update the webview.
=======
    # Calling it should be side-effect-free and NOT update the WASM.
    #
    # @return [String] the rendered HTML
>>>>>>> c1fdce9 (merged new commits from original)
    def to_html
      @children ||= []
      child_markup = @children.map(&:to_html).join
      if respond_to?(:element)
        element { child_markup }
      else
        child_markup
      end
    end

    # This binds a Scarpe JS callback, handled via a single dispatch point in the document root
    def bind(event, &block)
      raise("Widget has no linkable_id! #{inspect}") unless linkable_id

<<<<<<< HEAD
      WASMDisplayService.instance.doc_root.bind("#{linkable_id}-#{event}", &block)
=======
      WASMDisplayService.instance.app.bind("#{linkable_id}-#{event}", &block)
>>>>>>> c1fdce9 (merged new commits from original)
    end

    # Removes the element from both the Ruby Widget tree and the HTML DOM.
    # Return a promise for when that HTML change will be visible.
    def destroy_self
      @parent&.remove_child(self)
      html_element.remove
    end

    # It's really hard to do dirty-tracking here because the redraws are fully asynchronous.
    # And so we can't easily cancel one "in flight," and we can't easily pick up the latest
    # changes... And we probably don't want to, because we may be halfway through a batch.
    def needs_update!
<<<<<<< HEAD
      WASMDisplayService.instance.doc_root.request_redraw!
=======
      WASMDisplayService.instance.app.request_redraw!
>>>>>>> c1fdce9 (merged new commits from original)
    end

    def handler_js_code(handler_function_name, *args)
      raise("Widget has no linkable_id! #{inspect}") unless linkable_id

      js_args = ["'#{linkable_id}-#{handler_function_name}'", *args].join(", ")
      "scarpeHandler(#{js_args})"
    end
  end
end
