class EmailAlert < ActiveRecord::Base

  serialize :all_params
  before_save :parse_machine_info
  after_create :run_alerts!

  def parse_machine_info
    self.subject ||= "" #nil protection

    if is_offline_alert?
      self.machine_name = subject.split(" ").first.split(".").first
      self.machine_group = subject.split(" ").first.split(".")[1..-1].join(".")
    elsif is_group_offline_alert?
      self.machine_name = all_params.body.split("\n").third #?
      self.machine_group = subject.split(" ").fifth
    end
  end

  def whole_machine_string
    subject.split(" ").first
  end


  def run_alerts!
    setting = Setting.first
    return mail_alert! unless setting #just bail if they aren't configured.
    puts "past settings.."
    #if matches a setting for always alert, do it now
    if setting.page_now_for_machine?(whole_machine_string)
      puts "page now"
      page_alert!
    elsif setting.alert_now_for_machine?(whole_machine_string)
      puts "mail now"
      mail_alert!
    else
      #else, setup a worker for 2 minutes from now to look for a group downtime
      # AlertWorker.perform_in(3.minutes,self.id)
      alert_for_threshold!
    end
  end

  def mail_alert!
    AlertMailer.send_alert(self).deliver_now
  end

  def page_alert!
    AlertMailer.send_page(self).deliver_now unless Setting.first.try(:silence_now?)
  end

  def alert_for_threshold!

    the_group = machine_group
    if EmailAlert.where(alert_fired: true).where(created_at: Time.now-60.minutes..Time.now).where(machine_group: the_group).any?
      puts "ALREADY FIRED ONE FOR THIS GROUP IN LAST 60 MINUTES"
      return false
    end

    threshold = Setting.first.try(:number_of_machines_in_single_group_to_page) || 5

    if is_group_offline_alert?
      the_count = group_offline_count
    else
      the_count = EmailAlert.where(created_at: Time.now-15.minutes..Time.now).count
    end

    if the_count > threshold
      #alert!
      page_alert!
      self.update_attributes(alert_fired: true)
    end

  end

  #helper methods

  def is_offline?
    subject.include?(" is offline")
  end

  def is_offline_alert?
    subject.split(" ").size == 3 && is_offline?
  end

  def is_group_offline_alert?
    subject.split(" ").size == 7 && subject.include?(" went offline")
  end

  def group_offline_count
    subject.split(" ").first.to_i
  end



  def self.clean_old_entries_from_db!
    EmailAlert.where(created_at: Time.now-1.year..Time.now-3.days).delete_all
  end

end

# == Schema Information
#
# Table name: email_alerts
#
#  id            :integer          not null, primary key
#  subject       :string
#  machine_group :string
#  machine_name  :string
#  all_params    :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  alert_fired   :boolean          default("f")
#
