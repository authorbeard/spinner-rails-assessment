class CreateUsers < ActiveRecord::Migration

  create_table :users do |t|
    t.string :name
  end

end