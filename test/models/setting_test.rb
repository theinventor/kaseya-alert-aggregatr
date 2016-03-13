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
#

require 'test_helper'

class SettingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
