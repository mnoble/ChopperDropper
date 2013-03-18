module Components
  module Size
    attr_accessor :width
    attr_accessor :height

    def prepare(options={})
      @width  = options[:width]
      @height = options[:height]
    end
  end
end
