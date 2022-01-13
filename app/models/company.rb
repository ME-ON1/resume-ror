class Company < ApplicationRecord
  has_many(:projects, dependent: :destroy)
  accepts_nested_attributes_for(:projects,  reject_if: :reject_project_create, allow_destroy: true)

  def reject_project_create
    project[:name].blank? or project[:project_url].blank? or project[:description].blank? or project[:tech_stack].blank?
  end
end
