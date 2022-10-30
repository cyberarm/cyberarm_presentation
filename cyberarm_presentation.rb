require_relative "../cyberarm_engine/lib/cyberarm_engine"

require_relative "lib/window"
require_relative "lib/presentation"
require_relative "lib/template"
require_relative "lib/slide"
require_relative "lib/dsl"

include CyberarmPresentation::DSL

presentation(template: :primary) do
  template(name: :primary) do
    stack(width: 1.0, height: 1.0, background: 0xff_222222) do
      banner "HELLO WORLD", width: 1.0, text_align: :center

      yield_slide
    end
  end

  slide(transition: :slide_in_out) do
    stack(width: 1.0, max_width: 1200, fill: true, h_align: :center, background: 0xaa_151515) do
      title "Hello there, HUMANS!"
    end
  end

  slide(transition: :slide_in_out) do
    stack(width: 1.0, max_width: 200, h_align: :center, fill: true, background: 0xff_151515) do
      tagline "Hello there, ROBOTS!"
    end
  end
end
