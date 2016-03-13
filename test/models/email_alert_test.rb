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

require 'test_helper'

class EmailAlertTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
