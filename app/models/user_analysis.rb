class UserAnalysis < ApplicationRecord
  belongs_to :analysis
  belongs_to :checkup, inverse_of: :user_analyses
  delegate :category, to: :analysis
  #validates :name, :value, presence: true
end
