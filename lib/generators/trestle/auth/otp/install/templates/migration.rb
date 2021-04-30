class AddOtpFields < ActiveRecord::Migration[5.2]
  def up
    add_column :administrators, :otp_secret_key, :string
    add_column :administrators, :otp_module, :boolean, default: false

    Administrator.find_each { |a| a.update_attribute(:otp_secret_key, Administrator.otp_random_secret) }
  end

  def down
    remove_column :administrators, :otp_module
    remove_column :administrators, :otp_secret_key
  end
end