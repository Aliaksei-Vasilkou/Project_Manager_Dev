class AddOwnerIdFieldToTask < ActiveRecord::Migration[5.1]
    def change
      add_column :tasks, :owner, :integer
    end
end
