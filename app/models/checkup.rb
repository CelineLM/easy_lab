class Checkup < ApplicationRecord
  belongs_to :user
  has_many :user_analyses, dependent: :destroy, inverse_of: :checkup
  accepts_nested_attributes_for :user_analyses,
                                 reject_if: proc { |attributes| attributes[:analysis_id].blank? }, 
                                 allow_destroy: true
  validates :laboratory_name, presence: true
  validates :realized_on, presence: true
end
