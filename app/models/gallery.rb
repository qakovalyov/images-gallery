class Gallery < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :pictures, dependent: :destroy
end
