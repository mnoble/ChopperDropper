module Renderers
  class Wagon
    attr_accessor :wagon

    def initialize(wagon)
      @wagon = wagon
    end

    def render
      image.draw(wagon.x, wagon.y)
    end

    def image
      @image ||= Image.new("assets/wagon.png", false, Image::FILTER_NEAREST)
    end
  end
end
