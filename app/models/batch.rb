class Batch < ApplicationRecord
  has_many :product_reports
  has_many :batch_files
  validates :name, presence: true
end
