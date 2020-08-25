class UserAnalysis < ApplicationRecord
  belongs_to :analysis
  belongs_to :checkup

  validates :name, :value, presence: true
end
