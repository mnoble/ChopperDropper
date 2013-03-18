module Entities
  class Base
    class << self
      attr_accessor :components
    end

    def self.use(component, options={})
      @components ||= []
      @components << [component, options]
    end

    def initialize
      components.each do |component, options|
        extend component
        prepare(options)
        EntityManager.register(self, component)
      end
    end

    def components
      self.class.components
    end
  end
end
