class RemoveConfederationColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :confederations, :jg
    remove_column :confederations, :pt
    remove_column :confederations, :vt
    remove_column :confederations, :ep
    remove_column :confederations, :dr
    remove_column :confederations, :gp
    remove_column :confederations, :gc
  end
end
