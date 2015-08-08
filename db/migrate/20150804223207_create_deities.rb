class CreateDeities < ActiveRecord::Migration
  def change
    create_table :deities, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :name
      t.string :name_hiragana
      t.string :name_katakana
      t.text :detail
      t.text :tags, array: true

      t.timestamps null: false
    end
  end
end
