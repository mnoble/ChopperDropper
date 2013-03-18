module Entities
  class Chopper < Base
    use Components::Spatial, x: 100, y: 100
    use Components::Size, width: 56, height: 24
    use Components::Controllable
  end
end
