class AddSilenceNowToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :silence_now, :boolean, default: false
  end
end
