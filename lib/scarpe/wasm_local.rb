# frozen_string_literal: true

require_relative "wasm_requires"
require_relative "wasm/wasm_local_display"

Scarpe::DisplayService.set_display_service_class(Scarpe::WASMDisplayService)
