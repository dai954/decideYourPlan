class Search < ApplicationRecord
  belongs_to :place
  belongs_to :subplace, optional: true
  belongs_to :user, optional: true
end
