class Category < ApplicationRecord
  has_many :analyses
  # has_many :user_analyses, through :analyses
end
