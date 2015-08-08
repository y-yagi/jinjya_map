class Deity < ActiveRecord::Base
  has_and_belongs_to_many :shrines

  validates :name, presence: true
  validates :name_hiragana, presence: true

  before_save :set_name_katakana

  def set_name_katakana
    self.name_katakana = Moji.hira_to_kata(self.name_hiragana)
  end
end
