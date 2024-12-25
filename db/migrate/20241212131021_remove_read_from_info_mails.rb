class RemoveReadFromInfoMails < ActiveRecord::Migration[7.0]
  def change
    remove_column :info_mails, :read, :boolean
  end
end
