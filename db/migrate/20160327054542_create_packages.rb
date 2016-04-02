class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|

      t.timestamps
      t.string :name
      t.string :sender
      t.string :type
      t.string :carrier
      t.string :in_by
      t.date :in_date
      t.string :signature
      t.string :out_by
      t.date :out_date
    end
  end
end
