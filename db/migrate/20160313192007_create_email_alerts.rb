class CreateEmailAlerts < ActiveRecord::Migration
  def change
    create_table :email_alerts do |t|
      t.string :subject
      t.string :machine_group
      t.string :machine_name
      t.text :all_params

      t.timestamps null: false
    end
  end
end
