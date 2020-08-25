class Analysis < ApplicationRecord
  belongs_to :category
  has_many :user_analysis

  validates :name, :description, uniqueness: true
end
