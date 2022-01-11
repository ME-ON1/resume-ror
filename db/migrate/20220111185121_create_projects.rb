class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :project_url
      t.string :description
      t.string :tech_stack

      t.belongs_to: :profile, index: {unique: true }, foreign_key: true
      t.timestamps
    end
  end
end
