class Gallery < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :pictures
end
