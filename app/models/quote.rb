# frozen_string_literal: true

class Quote < ApplicationRecord
  belongs_to :company

  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }
  # Ex:- scope :active, -> {where(:active => true)}

  # after_create_commit -> { broadcast_prepend_later_to "quotes" }
  # after_update_commit -> { broadcast_replace_later_to "quotes" }
  # after_destroy_commit -> { broadcast_remove_to "quotes" }
  # Those three callbacks above  are equivalent to the following single line
  broadcasts_to ->(quote) { [quote.company, 'quotes'] }, inserts_by: :prepend
end
