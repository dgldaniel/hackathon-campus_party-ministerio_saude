class IncrementLimitPhoneOnPatient < ActiveRecord::Migration[6.0]
  def change
    change_column :patients, :phone, :string, limit: 15
  end
end
