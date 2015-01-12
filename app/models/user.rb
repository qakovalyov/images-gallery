class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :profile, class_name: 'UserProfile', dependent: :destroy, autosave: true
  accepts_nested_attributes_for :profile
  validates_presence_of :first_name, :last_name


  after_create :create_dependencies

  private

  def create_dependencies
    self.profile = UserProfile.create
    self.save
  end

end
