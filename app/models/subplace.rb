class Subplace < ApplicationRecord
  belongs_to :place
  has_many :search
end
