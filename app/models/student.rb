class Student < ActiveRecord::Base
  validates :first_name,
    :last_name, :email, :cell_phone, :home_phone, :work_phone, presence: true

  validates_each :cell_phone, :work_phone, :home_phone do |record, attr, value|
    record.errors.add attr, 'phone numbers should be 10 numbers long.' if value.length != 10
  end

  validates :email, format: /@/

end
