class Profile < ApplicationRecord
  belongs_to :user

  validate :first_or_last_name_present
  validates :gender, inclusion: ["male", "female"]
  #validate :male_or_female
  validate :prevent_male

  def first_or_last_name_present
    if first_name.nil? && last_name.nil?
      errors.add(:base, "You have to introduce at least name or last_name")
    end
  end

  #def male_or_female
  #  if (gender != 'male' && gender != 'female')
  #    errors.add(:base, "You have to introduce male or female")
  #  end
  #end

  def prevent_male
    if gender == "male" && first_name == "Sue"
      errors.add(:base, "You can not choose that name")
    end 
  end

  def self.get_all_profiles (min_year, max_year)
    Profile.where("birth_year BETWEEN :min_year AND :max_year", 
      min_year: min_year, max_year: max_year).order(birth_year: :asc)
  end 
end
