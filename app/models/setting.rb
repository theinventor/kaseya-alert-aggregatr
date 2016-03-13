class Setting < ActiveRecord::Base

  def always_alert_for_machines
    return [] unless always_alert_for_machine_pattern.present?

    always_alert_for_machine_pattern.to_s.split(",")
  end

  def always_page_for_machines
    return [] unless always_page_for_machine_pattern.present?

    always_page_for_machine_pattern.split(",")
  end

  def alert_now_for_machine?(machine_string)
    #machine string like: server123.companylocation.companygroup.root

    always_alert_for_machines.each do |pattern|
      return true if machine_string.include?(pattern)
    end

    return false
  end

  def page_now_for_machine?(machine_string)
    #machine string like: server123.companylocation.companygroup.root

    always_page_for_machines.each do |pattern|
      return true if machine_string.include?(pattern)
    end

    return false
  end

end

# == Schema Information
#
# Table name: settings
#
#  id                                         :integer          not null, primary key
#  always_alert_for_machine_pattern           :text
#  always_page_for_machine_pattern            :text
#  pager_email                                :string
#  number_of_machines_in_single_group_to_page :integer
#  created_at                                 :datetime         not null
#  updated_at                                 :datetime         not null
#  alert_email                                :string
#
