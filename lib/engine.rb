require "active_support/all"
require "set"

$LOAD_PATH << File.expand_path("../../java", __FILE__)
require "java"
require "lwjgl.jar"
require "slick.jar"

java_import org.newdawn.slick.AppGameContainer
java_import org.newdawn.slick.BasicGame
java_import org.newdawn.slick.Color
java_import org.newdawn.slick.GameContainer
java_import org.newdawn.slick.Graphics
java_import org.newdawn.slick.Image
java_import org.newdawn.slick.Input

$LOAD_PATH << File.expand_path("../../lib", __FILE__)
require "entity_manager"
require "components"
require "entities"
require "renderers"
require "systems"

class Engine < BasicGame
  attr_reader :chopper
  attr_reader :wagon

  attr_reader :chopper_renderer
  attr_reader :wagon_renderer

  attr_reader :input_system
  attr_reader :wagon_system
  attr_reader :boundry_system

  def init(container)
    @chopper = Entities::Chopper.new
    @wagon = Entities::Wagon.new

    @chopper_renderer = Renderers::Chopper.new(@chopper)
    @wagon_renderer = Renderers::Wagon.new(@wagon)

    @input_system = Systems::Input.new
    @wagon_system = Systems::Wagon.new(@wagon)
  end

  def update(container, delta)
    input_system.call(container.input, delta)
    wagon_system.call(delta)
  end

  def render(container, graphics)
    graphics.set_background(Color.white)
    chopper_renderer.render
    wagon_renderer.render
  end
end

game = AppGameContainer.new(Engine.new("ChopperDropper"))
game.set_display_mode(800, 600, false)
game.start

