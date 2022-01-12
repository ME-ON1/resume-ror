class Project < ApplicationRecord

    belongs_to :company
    #validates(:name, presence: true)
    #validates(:project_url, presence: true, uniqueness: { case_sensitive: false })
    #validates(:tech_stack, presence: true)
    #validates(:description, presence: true)
end
