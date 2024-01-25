class CreateAbilities < ActiveRecord::Migration[7.1]
  def change
    create_table :abilities do |t|

      t.timestamps
    end
  end
end
