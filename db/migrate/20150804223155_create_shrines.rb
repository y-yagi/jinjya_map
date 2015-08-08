class CreateShrines < ActiveRecord::Migration
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :shrines, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :name
      t.string :name_hiragana
      t.string :name_katakana
      t.text :detail
      t.float :longitude
      t.float :latitude
      t.string :address
      t.string :hp
      t.text :tags, array: true

      t.timestamps null: false
    end
  end
end
