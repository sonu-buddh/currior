class RenameOrderAasmState < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :assm_state, :aasm_state
  end
end
