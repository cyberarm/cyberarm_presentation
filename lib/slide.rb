module CyberarmPresentation
  class Slide
    attr_reader :template, :transition, :transition_duration, :auto_advance, :auto_advance_after, :block

    def initialize(template:, transition:, transition_duration:, auto_advance:, auto_advance_after:, block:)
      @template = template
      @transition = transition
      @transition_duration = transition_duration
      @auto_advance = auto_advance
      @auto_advance_after = auto_advance_after

      @block = block
    end
  end
end
