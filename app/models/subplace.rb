class Subplace < ApplicationRecord
  has_many :places
  has_many :search
end
