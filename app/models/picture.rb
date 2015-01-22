class Picture < ActiveRecord::Base
  belongs_to :gallery
  mount_uploader :image, ImageUploader

  validates_presence_of :image, :name


  def image_ur
    if image.present?
        image.url
    else
      'no_image_300x300.gif'
    end
  end

end
