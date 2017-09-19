class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :batches

  def admin?
    role_id == 1
  end

  def client?
    role_id == 2
  end

  def employee?
    role_id == 3
  end
end
