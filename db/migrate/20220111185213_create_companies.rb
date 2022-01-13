class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :position
      t.text :description
      t.date :start
      t.date :end

      t.belongs_to :profile, index: {unique: true }, foreign_key: true
      t.timestamps
    end
  end
end
