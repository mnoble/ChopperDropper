module Components
  module Spatial
    attr_accessor :x
    attr_accessor :y
    attr_accessor :x_velocity
    attr_accessor :y_velocity
    attr_accessor :speed

    def prepare(options={})
      @x = options.fetch(:x, 0)
      @y = options.fetch(:y, 0)
      @x_velocity = options.fetch(:x_velocity, 0)
      @y_velocity = options.fetch(:y_velocity, 0)
      @speed = options.fetch(:speed, 0.2)
    end

    def up(delta)
      self.y -= speed * delta
    end

    def right(delta)
      self.x += speed * delta
    end

    def down(delta)
      self.y += speed * delta
    end

    def left(delta)
      self.x -= speed * delta
    end
  end
end
