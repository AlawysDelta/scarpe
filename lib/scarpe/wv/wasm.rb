# frozen_string_literal: true

require "js"

class Scarpe
  class WASMInterops
    def bind(name, func = nil, &block)
      JS.global[:self][name.to_sym] = (func ? func : block)
      defined?(JS.global[:self][name.to_sym])
    end

    def eval(command)
      JS.eval(command)
    end

    def init(command)
      JS.eval(command)
    end

    def set_title(title)
      JS.global[:document][:title] = title
    end

    def set_size(width, height, hint)
      JS.global[:document][:body][:style][:width] = width
      JS.global[:document][:body][:style][:height] = height
    end

    def navigate(string)
      # JS.eval('var empty =
      # `body {
      #   font-family: arial, Helvetica, sans-serif;
      #   margin: 0;
      #   height: 100%;
      #   overflow: hidden;
      # }
      # p {
      #   margin: 0;
      # }`;')
      # JS.eval("var head = document.head || document.getElementsByTagName('head')[0];")
      # JS.eval("var style = document.createElement('style');")
      # JS.eval("head.appendChild(style);")
      # JS.eval("style.type = 'text/css';")
      # # JS.eval("style.id = 'style-wvroot';")
      # JS.eval("head.id = 'head-wvroot';")
      # JS.eval("head.appendChild(style);")
      # JS.eval("style.appendChild(document.createTextNode(empty));")
      # JS.eval("var body = document.body;")
      # JS.eval("body.id = 'body-wvroot';")
      # JS.eval("var newDiv = document.createElement('div');")
      # JS.eval("newDiv.id = 'wrapper-wvroot';")
      # JS.eval("body.appendChild(newDiv);")

      # style = JS.global[:document].createElement("style")
      # style[:id] = "style-wvroot"
      # style.appendChild(JS.global[:document].createTextNode("body {
      #   font-family: arial, Helvetica, sans-serif;
      #   margin: 0;
      #   height: 100%;
      #   overflow: hidden;
      # }
      # p {
      #   margin: 0;
      # }"))
      # JS.global[:document][:head].appendChild(style)
      # JS.global[:document][:head][:id] = "head-wvroot"
      # div = JS.global[:document].createElement("div")
      # div[:id] = "wrapper-wvroot"
      # JS.global[:document][:body].appendChild(div)
    end

    def run
      JS.eval("return new Promise(() => {})").await
      JS.global[:document].write("haha")
    end

    def destroy
      # stub
    end
  end
end
