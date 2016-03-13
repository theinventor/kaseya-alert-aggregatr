json.array!(@email_alerts) do |email_alert|
  json.extract! email_alert, :id, :subject, :machine_group, :machine_name, :all_params
  json.url email_alert_url(email_alert, format: :json)
end
