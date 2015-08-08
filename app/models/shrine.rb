class Shrine < ActiveRecord::Base
  has_and_belongs_to_many :deities

  validates :name, presence: true
  validates :name_hiragana, presence: true
  validates :address, presence: true

  before_save :set_geoinfo
  before_save :set_name_katakana

  def set_geoinfo
    geo_info = Geocoder.search(address)
    return if geo_info.empty?
    self.latitude = geo_info.first.geometry['location']['lat']
    self.longitude = geo_info.first.geometry['location']['lng']
  end

  def set_name_katakana
    self.name_katakana = Moji.hira_to_kata(self.name_hiragana)
  end
end
