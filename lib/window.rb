module CyberarmPresentation
  class Window < CyberarmEngine::Window
    def presentation=(instance)
      push_state(PresenterState, presentation: instance)
    end
  end

  class PresenterState < CyberarmEngine::GuiState
    def setup
      self.show_cursor = true
      @presentation = options[:presentation]

      @slide_index = 0

      setup_slide
    end

    def setup_slide
      @slide = @presentation.slides[@slide_index]
      @template = @presentation.templates[@slide.template]

      @slide_state = SlideState.new
      @slide_state.setup
      @slide_state.post_setup

      @slide_state.setup_slide(@template, @slide)
    end

    def next_slide
      slide_count = @presentation.slides.count

      @slide_index += 1
      @slide_index = slide_count - 1 if @slide_index >= slide_count
    end

    def previous_slide
      @slide_index -= 1
      @slide_index = 0 if @slide_index.negative?
    end

    def draw
      super

      @slide_state.draw
    end

    def update
      super
      setup_slide if @slide_index != @last_slide_index

      @slide_state.update

      @last_slide_index = @slide_index
    end

    def button_down(id)
      super

      case id
      when Gosu::KB_RIGHT, Gosu::MS_LEFT
        next_slide
      when Gosu::KB_LEFT
        previous_slide
      end
    end
  end

  class SlideState < CyberarmEngine::GuiState
    def setup
      theme(
        {
          TextBlock: { text_static: true }
        }
      )
    end

    def setup_slide(template, slide)
      instance_exec(template, slide) do |template, slide|
        @slide = slide

        instance_eval(&template.block)
      end
    end

    def yield_slide
      instance_eval(&@slide.block)
    end
  end
end
