class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string  :target
      t.string  :shortcut
      t.integer :access_count, :default => 0

      t.timestamps
    end
  end
end
