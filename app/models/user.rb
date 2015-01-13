class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :profile, class_name: 'UserProfile', dependent: :destroy, autosave: true
  validates_presence_of :first_name, :last_name, :email

  after_create :create_dependencies


  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def create_dependencies
    self.profile = UserProfile.create
    self.profile.user = self
    self.save
  end

end
