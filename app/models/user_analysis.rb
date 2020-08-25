class UserAnalysis < ApplicationRecord
  belongs_to :analysis
  belongs_to :checkup
  delegate :category, to: :analyses
  validates :name, :value, presence: true
end
