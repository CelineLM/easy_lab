class Checkup < ApplicationRecord
  belongs_to :user
  has_many :user_analyses
end
