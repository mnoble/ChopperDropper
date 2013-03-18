module Renderers
  class Chopper
    attr_accessor :chopper

    def initialize(chopper)
      @chopper = chopper
    end

    def render
      image.draw(chopper.x, chopper.y)
    end

    def image
      @image ||= Image.new("assets/chopper.png", false, Image::FILTER_NEAREST)
    end
  end
end
