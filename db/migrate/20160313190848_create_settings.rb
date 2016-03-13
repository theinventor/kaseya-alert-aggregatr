class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.text :always_alert_for_machine_pattern
      t.text :always_page_for_machine_pattern
      t.string :pager_email
      t.integer :number_of_machines_in_single_group_to_page

      t.timestamps null: false
    end
  end
end
