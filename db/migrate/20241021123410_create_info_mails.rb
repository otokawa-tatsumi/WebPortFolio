class CreateInfoMails < ActiveRecord::Migration[7.0]
  def change
    create_table :info_mails do |t|
      t.string :sender
      t.string :mail_address
      t.string :message
      t.string :received_date_and_time
      t.boolean :check_flag

      t.timestamps
    end
  end
end
