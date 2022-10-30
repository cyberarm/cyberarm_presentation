module CyberarmPresentation
  class Presentation
    attr_reader :templates, :slides

    def initialize(template:, transition: :ease_in_out, transition_duration: 750, block:)
      @template = template
      @transition = transition
      @transition_duration = transition_duration

      @templates = {}
      @slides = []

      instance_eval(&block)

      present!
    end

    def present!
      w = Window.new(resizable: true)
      w.presentation = self
      w.show
    end

    def template(name:, &block)
      @templates[name] = Template.new(name: name, block: block)
    end

    def slide(template: @template, transition: @transition, transition_duration: @transition_duration, auto_advance: false, auto_advance_after: 0, &block)
      @slides << Slide.new(
        template: template,
        transition: transition,
        transition_duration: transition_duration,
        auto_advance: auto_advance,
        auto_advance_after: auto_advance_after,
        block: block
      )
    end
  end
end
