# frozen_string_literal: true

# require "logging"
require "json"
require "js"

class Scarpe
  LOG_LEVELS = [:debug, :info, :warn, :error, :fatal].freeze

  # Include this module to get a @log instance variable to log as your
  # configured component.
  module Log
    DEFAULT_LOG_CONFIG = {
      "default" => "info",
    }
    DEFAULT_DEBUG_LOG_CONFIG = {
      "default" => "debug",
    }
    class LogStub
      def error(string)
        # div = JS.global[:document].getElementById("logs")
        # content = JS.global[:document].createTextNode("error: #{string}\n")
        # br = JS.global[:document].createElement("br")
        # div.appendChild(content)
        # div.appendChild(br)
        puts "error: #{string}\n"
      end

      def warn(string)
        # div = JS.global[:document].getElementById("logs")
        # content = JS.global[:document].createTextNode("warn: #{string}\n")
        # br = JS.global[:document].createElement("br")
        # div.appendChild(content)
        # div.appendChild(br)
        puts "warn: #{string}\n"
      end

      def debug(string)
        # div = JS.global[:document].getElementById("logs")
        # content = JS.global[:document].createTextNode("debug: #{string}\n")
        # br = JS.global[:document].createElement("br")
        # div.appendChild(content)
        # div.appendChild(br)
        puts "debug: #{string}\n"
      end

      def info(string)
        # div = JS.global[:document].getElementById("logs")
        # content = JS.global[:document].createTextNode("info: #{string}\n")
        # br = JS.global[:document].createElement("br")
        # div.appendChild(content)
        # div.appendChild(br)
        puts "info: #{string}\n"
      end
    end

    def log_init(component = self)
      # div = JS.global[:document].createElement("div")
      # div[:id] = "logs"
      # div[:hidden] = 1
      # next_div = JS.global[:document].getElementById("wrapper-wvroot")
      # logs = JS.global[:document].getElementById("logs")
      # if logs.inspect == "null"
      #   JS.global[:document][:body].insertBefore(div, next_div)
      # end
      @log = Scarpe::Log::LogStub.new
    end

    class Logger
      DEFAULT_COMPONENT = "default"

      class << self
        attr_reader :current_log_config

        def logger(component = self)
          #Logging.logger[component]
        end

        private

        def name_to_severity(data)
          # case data
          # when "debug"
          #   :debug
          # when "info"
          #   :info
          # when "warn"
          #   :warn
          # when "err", "error"
          #   :error
          # when "fatal"
          #   :fatal
          # else
          #   raise "Don't know how to treat #{data.inspect} as a logger severity!"
          # end
        end

        def json_to_appender(data)
          # case data.downcase
          # when "stdout"
          #   Logging.appenders.stdout layout: @custom_log_layout
          # when "stderr"
          #   Logging.appenders.stderr layout: @custom_log_layout
          # when String
          #   Logging.appenders.file data, layout: @custom_log_layout
          # else
          #   raise "Don't know how to convert #{data.inspect} to an appender!"
          # end
        end

        def json_configure_logger(logger, data)
          # case data
          # in String
          #   sev = name_to_severity(data)
          #   logger.level = sev
          # in [level, *locations]
          #   if logger.name != "root"
          #     # The Logging gem doesn't have an additive property on the root logger
          #     logger.additive = false # Don't also log to parent/root loggers
          #   end

          #   logger.appenders = locations.map { |where| json_to_appender(where) }

          #   logger.level = name_to_severity(level)
          # else
          #   raise "Don't know how to use #{data.inspect} to specify a logger!"
          # end
        end

        def freeze_log_config(log_config)
          # log_config.each do |k, v|
          #   k.freeze
          #   v.freeze
          #   v.each(&:freeze) if v.is_a?(Array)
          # end
          # log_config.freeze
        end

        public

        def configure_logger(log_config)
          # # TODO: custom coloring? https://github.com/TwP/logging/blob/master/examples/colorization.rb
          # @custom_log_layout = Logging.layouts.pattern pattern: '[%r] %-5l %c: %m\n'

          # if log_config.is_a?(String) && File.exist?(log_config)
          #   log_config = JSON.load_file(log_config)
          # end

          # log_config = freeze_log_config(log_config) unless log_config.nil?
          # @current_log_config = log_config # Save a copy for later

          # Logging.reset # Reset all Logging settings to defaults
          # Logging.reopen # For log-reconfig (e.g. test failures), often important to *not* store an open handle to a moved file
          # return if log_config.nil?

          # Logging.logger.root.appenders = [Logging.appenders.stdout]

          # default_logger = log_config[DEFAULT_COMPONENT] || "info"
          # json_configure_logger(Logging.logger.root, default_logger)

          # log_config.each do |component, logger_data|
          #   next if component == DEFAULT_COMPONENT

          #   sublogger = Logging.logger[component]
          #   json_configure_logger(sublogger, logger_data)
        end
      end
    end
  end

  class LoggedWrapper
    include ::Scarpe::Log
    def initialize(instance, component = instance)
      # log_init(component)

      # @instance = instance
    end

    def method_missing(method, ...)
      # self.singleton_class.define_method(method) do |*args, **kwargs, &block|
      #   ret = @instance.send(method, *args, **kwargs, &block)
      #   @log.info("Method: #{method} Args: #{args.inspect} KWargs: #{kwargs.inspect} Block: #{block ? "y" : "n"} Return: #{ret.inspect}")
      #   ret
      # end
      # send(method, ...)
    end
  end
  # end



  # log_config = if ENV["SCARPE_LOG_CONFIG"]
  #   JSON.load_file(ENV["SCARPE_LOG_CONFIG"])
  # else
  #   ENV["SCARPE_DEBUG"] ? Scarpe::Log::DEFAULT_DEBUG_LOG_CONFIG : Scarpe::Log::DEFAULT_LOG_CONFIG
  # end

  # Scarpe::Logger.configure_logger(log_config)
end
