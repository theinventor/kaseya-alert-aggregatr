class AddAlertFiredToEmailAlert < ActiveRecord::Migration
  def change
    add_column :email_alerts, :alert_fired, :boolean, default: false
  end
end
