class AddDetailsToInfoMails < ActiveRecord::Migration[7.0]
  def change
    add_column :info_mails, :read, :boolean
  end
end
