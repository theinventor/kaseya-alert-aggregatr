class AddAlertEmailToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :alert_email, :string
  end
end
