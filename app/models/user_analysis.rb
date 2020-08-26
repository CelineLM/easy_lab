class UserAnalysis < ApplicationRecord
  belongs_to :analysis
  belongs_to :checkup
  delegate :category, to: :analysis
  validates :name, :value, presence: true
end
