class ProductReport < ApplicationRecord
  belongs_to :batch

  def approved?
  	status == 'approved'
  end

  def rejected?
  	status == 'rejected'
  end
end
