class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string     :term
      t.text       :definition
      t.references :deck

      t.timestamps
    end
  end
end
