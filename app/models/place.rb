# frozen_string_literal: true

class Place < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true

  mount_uploader :image, ImageUploader

  paginates_per 20
end
