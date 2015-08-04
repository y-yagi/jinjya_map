class CreateJoinTableDeityShrine < ActiveRecord::Migration
  def change
    create_join_table :deities, :shrines do |t|
      t.index [:deity_id, :shrine_id]
      t.index [:shrine_id, :deity_id]
    end
  end
end
