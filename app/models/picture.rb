class Picture < ActiveRecord::Base
  belongs_to :gallery
  mount_uploader :image, ImageUploader

  validates_presence_of :image, :name
  validates_length_of :hashtags, minimum: 0, maximum: 50
  validates_length_of :name, minimum: 0, maximum: 20


  def image_ur
    if image.present?
        image.url
    else
      'no_image_300x300.gif'
    end
  end

  def self.search_by_name(query)
    where("lower(name) like ?", "%#{query}%")
  end

  def self.search_by_hashtags(query)
    where("lower(hashtags) like ?", "%#{query}%")
  end

  def get_hashtags_array
    hashtags.split.map {|hashtag| '#' + hashtag }
  end
end
