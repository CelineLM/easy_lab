class Analysis < ApplicationRecord
  belongs_to :category
  has_many :user_analysis
  has_one_attached :photo

  validates :name, :description, uniqueness: true
end
