# frozen_string_literal: true

# app/components/form_field_component.rb
class FormFieldComponent < ViewComponent::Base
  def initialize(form:, field:, label: nil, type: :text, options: {}, classes: "")
    @form = form
    @field = field
    @label = label || field.to_s.humanize
    @type = type
    @options = options # for select, radio, etc.
    @classes = classes
  end

  def errors
    @form.object.errors[@field]
  end

  def input_html
    case @type
    when :text
      @form.text_field(@field, class: input_base)
    when :email
      @form.email_field(@field, class: input_base)
    when :password
      @form.password_field(@field, class: input_base)
    when :number
      @form.number_field(@field, class: input_base)
    when :textarea
      @form.text_area(@field, class: "#{input_base} h-24")
    when :select
      if @options.is_a?(ActiveRecord::Relation) || @options.is_a?(Array) && @options.first.is_a?(ActiveRecord::Base)
        # Expect collection of models
        @form.select(
        @field,
        options_from_collection_for_select(@options, :id, :name, @form.object[@field]),
        {},
        class: "select #{border_class} w-full #{@classes}"
      )
      else
        # Expect array of pairs like [["Admin", "admin"], ["User", "user"]]
        @form.select(@field, @options, {}, class: "select #{border_class} w-full #{@classes}")
      end
    when :checkbox
      checkbox_wrapper
    else
      @form.text_field(@field, class: input_base)
    end
  end

  private

  def input_base
    # "input input-bordered w-full #{@classes}"
    "input w-full #{@classes}"
  end

  def border_class
  @variant.present? ? "input-#{@variant}" : "input-bordered"
  end
  def checkbox_wrapper
    content_tag(:label, class: "label cursor-pointer flex gap-2 items-center") do
      @form.check_box(@field, class: "checkbox") +
      content_tag(:span, @label, class: "label-text")
    end
  end
end
