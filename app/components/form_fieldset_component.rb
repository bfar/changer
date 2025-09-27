# frozen_string_literal: true

class FormFieldsetComponent < ViewComponent::Base
  def initialize (legend: nil, classes: "")
    @legend = legend
    @classes = classes
  end
end
