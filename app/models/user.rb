class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  validates :username, presence: { message: "Username required" }
  validates :username, uniqueness: { message: "Username already present, please choose another one" }, if: -> { self.username.present? }
  validates :first_name, presence: { message: "First name required" }
  validates :last_name, presence: { message: "Last name required" }
#  validates :sex, presence: { message: "Sex required" }
#  validates :birthday, presence: { message: "Birthday required" }

  has_many :thoughts, dependent: :destroy
  
  
#  def to_param
#	username
#  end

  has_many :liked_thoughts, dependent: :destroy
  has_many :favorite_thoughts, dependent: :destroy
  
end
