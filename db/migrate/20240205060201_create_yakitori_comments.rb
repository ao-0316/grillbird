class CreateYakitoriComments < ActiveRecord::Migration[6.1]
  def change
    create_table :yakitori_comments do |t|

      t.integer :customer_id
      t.integer :yakitori_id
      t.text :comment

      t.timestamps
    end
  end
end
