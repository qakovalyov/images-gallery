class Picture < ActiveRecord::Base
  belongs_to :gallery, dependent: :destroy
end
