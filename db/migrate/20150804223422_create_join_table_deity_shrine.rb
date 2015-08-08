class CreateJoinTableDeityShrine < ActiveRecord::Migration
  def change
    create_table :deities_shrines, id: false do |t|
      t.column :deity_id, :uuid, null: false
      t.column :shrine_id, :uuid, null: false
    end
  end
end
