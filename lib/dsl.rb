module CyberarmPresentation
  module DSL
    def presentation(**options, &block)
      raise "Only one presentation permitted" if @presentation

      @presentation = Presentation.new(**options, block: block)
    end

    # def template(name, &block)
    #   @presentation.templates << Template.new(name: name, block: block)
    # end

    # def slide(**options, &block)
    #   @presentation.templates << Slide.new(**options, block: block)
    # end
  end
end
