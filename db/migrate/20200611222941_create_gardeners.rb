class CreateGardeners < ActiveRecord::Migration[6.0]
  def change
    create_table :gardeners do |t|
      t.string :name
      t.string :username
      t.string :password_digest
    end
  end
end
