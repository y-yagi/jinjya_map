class CreateJoinTableDeityShrine < ActiveRecord::Migration
  def change
    create_table :deities_shrines, id: false do |t|
      t.uuid :deity_id, null: false
      t.uuid :shrine_id, null: false
    end
  end
end
