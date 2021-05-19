class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal,       null:false
      t.string     :city,         null:false
      t.string     :address,      null:false
      t.string     :apart
      t.string     :number,       null:false
      t.references :order,        foreign_key: true
      t.integer    :area_id,      null: false
      t.timestamps
    end
  end
end
