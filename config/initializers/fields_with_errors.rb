# frozen_string_literal: true
ActionView::Base.field_error_proc = proc do |html_tag, instance|
  html_doc = Nokogiri::HTML::DocumentFragment.parse(html_tag, Encoding::UTF_8.to_s)
  element = html_doc.children[0]

  if element
      if !element.attributes['type'].nil? && element.attributes['type'].value == 'text'
        element.add_class('is-invalid')

        instance.raw(%(#{html_doc.to_html} <div class="invalid-feedback d-block">#{[*instance.error_message].to_sentence}</div>))
      else
        instance.raw(html_doc.to_html)
      end
  else
      html_tag
  end
end
