class Customer < ApplicationRecord
  validates :fname,:lname,:phone, presence: true
  validates :phone, uniqueness: {message: 'הטלפון כבר קיים במערכת'}
end
