module Systems
  class Input
    def call(input, delta)
      entities.each do |entity|
        entity.up(delta)    if input.is_key_down(::Input::KEY_UP)
        entity.right(delta) if input.is_key_down(::Input::KEY_RIGHT)
        entity.down(delta)  if input.is_key_down(::Input::KEY_DOWN)
        entity.left(delta)  if input.is_key_down(::Input::KEY_LEFT)
      end
    end

    def entities
      EntityManager.entities_with(:controllable, :spatial)
    end
  end
end
