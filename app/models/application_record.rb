class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  validates :title, :description, profanity_filter: true
end
