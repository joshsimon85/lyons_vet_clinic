class DescriptionValidator < EmployeeValidator
  def validate(record)
    if internal_user?(record) && description_invalid?(record)
      record.errors.add(:description, 'is required for employees')
    end
  end

  private

  def description_invalid?(record)
    record.description == nil
  end
end
