# frozen_string_literal: true
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.create_from_hash(array)
    array_to_created = array.map do |each_element|
      each_element.select! { |key| column_names.include?(key) unless key == ':doctor_id' }
      p(each_element)
      each_element
    end

    create(array_to_created)
  end
end
