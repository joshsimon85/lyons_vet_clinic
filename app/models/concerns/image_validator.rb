class ImageValidator < EmployeeValidator
  def validate(record)
    if internal_user?(record) && !record.profile_image.attached?
      record.errors.add(:profile_image, 'is required for employees')
    end
  end
end
