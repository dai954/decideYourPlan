class Place < ApplicationRecord
  has_many :restaurants

  def self.search(search)
    return Place.all unless search
    Place.where('name LIKE(?)', "%#{search}%")
  end
end
