class CreateBotMoves < ActiveRecord::Migration[7.1]
  def change
    create_table :bot_moves do |t|
      t.string :guid
      t.string :direction

      t.timestamps
    end
  end
end
