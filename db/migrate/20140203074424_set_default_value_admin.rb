class SetDefaultValueAdmin < ActiveRecord::Migration
  def self.up
  	change_column :users, :admin, :boolean, :default => false
  end

  def self.down
  	# You can't currently remove default values in Rails
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
