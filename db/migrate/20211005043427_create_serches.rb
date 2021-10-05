class CreateSerches < ActiveRecord::Migration[5.2]
  def change
    create_table :serches do |t|

      t.timestamps
    end
  end
end
