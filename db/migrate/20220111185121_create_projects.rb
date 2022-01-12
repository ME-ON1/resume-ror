class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :project_url
      t.text :description
      t.string :tech_stack

      t.belongs_to :company, index: { unique: true }, foreign_key: true
      t.timestamps
    end
  end
end
