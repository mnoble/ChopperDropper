module Systems
  class Wagon
    attr_reader :wagon

    def initialize(wagon)
      @wagon = wagon
    end

    def call(delta)
      wagon.right(delta)
    end
  end
end
