class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :patient_id
      t.string :order_provider
      t.string :order_name
      t.date :lab_date
      t.string :lab_ord_dtl
      t.string :lab_analyte
      t.string :lab_order_type
      t.string :lab_value
      t.string :lab_interpretation
      t.integer :order_id
      t.string :order_src
      t.string :lab_local_temp_list
      t.string :lab_order_genus
      t.string :lab_status

      t.timestamps
    end
  end
end
