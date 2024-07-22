# frozen_string_literal: true

class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }
  # Ex:- scope :active, -> {where(:active => true)}

  after_create_commit -> { broadcast_prepend_to 'quotes' }
  after_update_commit -> { broadcast_replace_to 'quotes' }
end
