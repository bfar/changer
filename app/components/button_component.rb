# frozen_string_literal: true

# app/components/button_component.rb
class ButtonComponent < ViewComponent::Base
  def initialize(
    text: nil,
    url: nil,
    variant: :primary, # DaisyUI semantic: primary, secondary, accent, ghost, etc.
    size: nil,         # DaisyUI sizes: sm, lg, wide
    classes: "",
    method: nil
  )
    @text = text
    @url = url
    @variant = variant
    @size = size
    @classes = classes
    @method = method
  end

  def button_classes
    [
      "btn",
      ("btn-#{@variant}" if @variant),
      ("btn-#{@size}" if @size),
      @classes
    ].compact.join(" ")
  end
end
