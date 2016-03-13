class AlertWorker
  include Sidekiq::Worker

  sidekiq_options :retry => 1 # Only five retries and then to the Dead Job Queue

  def perform(email_alert_id)
    email = EmailAlert.find(email_alert_id)

    the_group = email.machine_group
    return false if EmailAlert.where(alert_fired: true).where(created_at: Time.now-60.minutes..Time.now).where(machine_group: the_group).any?

    the_count = EmailAlert.where(created_at: Time.now-15.minutes..Time.now).count
    threshold = Settings.first.try(:number_of_machines_in_single_group_to_page) || 5

    if the_count > threshold
      #alert!
    end
  end

end