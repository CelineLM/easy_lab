class Checkup < ApplicationRecord
  belongs_to :user
  has_many :user_analyses
  has_one_attached :file
end
