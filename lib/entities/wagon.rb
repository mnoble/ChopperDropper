module Entities
  class Wagon < Base
    use Components::Spatial, x: 80, y: 578, speed: 0.05
    use Components::Size, width: 70, height: 22
  end
end
