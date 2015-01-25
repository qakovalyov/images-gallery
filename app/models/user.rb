class User < ActiveRecord::Base
  ROLES = %w[admin moderator author banned] # don't change this string!!!!!!!!!!!!!

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :profile, class_name: 'UserProfile', dependent: :destroy, autosave: true
  belongs_to :gallery, dependent: :destroy
  has_many :pictures, through: :gallery

  validates_presence_of :first_name, :last_name, :email

  after_create :create_dependencies


  def full_name
    "#{first_name} #{last_name}"
  end

  def is?(role)
    roles.include?(role.to_s)
  end

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end


  private

  def create_dependencies
    self.roles = ['author']
    self.profile = UserProfile.create
    self.profile.user = self
    self.gallery = Gallery.create
    self.gallery.owner = self
    self.gallery.save
    self.skip_reconfirmation! #fixed 'first Devise Confirmation invalid on first send'
    self.save
  end

end
