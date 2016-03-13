json.array!(@settings) do |setting|
  json.extract! setting, :id, :always_alert_for_machine_pattern, :always_page_for_machine_pattern, :pager_email, :number_of_machines_in_single_group_to_page
  json.url setting_url(setting, format: :json)
end
