class User < ApplicationRecord
  has_many :tasks, dependent: :destroy

  enum role: { user: 0, admin: 1 }
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable


  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?

  before_validation :normalize_email

  private

  def password_required?
    new_record? || password.present? || password_confirmation.present?
  end

  def normalize_email
    self.email = email.downcase.strip if email.present?
  end
end
