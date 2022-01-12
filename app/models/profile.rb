class Profile < ApplicationRecord
    has_many(:educations, dependent: :destroy)
    has_many(:companies, dependent: :destroy)
    accepts_nested_attributes_for(:educations , reject_if: :reject_education_create, allow_destroy: true)
    accepts_nested_attributes_for(:companies, reject_if: :reject_companies_create, allow_destroy: true)

    belongs_to :user

    def reject_companies_create(companies)
      companies[:position].blank? or companies[:description].blank? or companies[:start].blank? or companies[:end].blank? or companies[:name].blank?
    end

    def reject_education_create(education)
        education[:degree].blank? or education[:school].blank? or education[:start].blank? or education[:end].blank?
    end
end
