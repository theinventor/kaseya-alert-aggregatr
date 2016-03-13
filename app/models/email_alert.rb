class EmailAlert < ActiveRecord::Base

  serialize :all_params
  before_save :parse_machine_info

  def parse_machine_info
    self.subject ||= "" #nil protection

    if is_offline_alert?
      self.machine_name = subject.split(" ").first.split(".").first
      self.machine_group = subject.split(" ").first.split(".")[1..-1].join(".")
    end
  end

  def self.clean_old_entries_from_db!
    EmailAlert.where(created_at: Time.now-1.year..Time.now-3.days).delete_all
  end


  #helper methods

  def is_offline?
    subject.include?(" is offline")
  end

  def is_offline_alert?
    subject.split(" ").size == 3 && is_offline?
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
#
