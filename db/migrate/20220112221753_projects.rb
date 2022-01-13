class Projects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |to|
      to.string :name
      to.string :project_url
      to.text   :description
      to.string :tech_stack, default: [], array: true

      to.belongs_to :profile, index: true, foreign_key: true

      to.timestamps
    end
  end
end
