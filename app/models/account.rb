class Account < ApplicationRecord
    has_many :translations
    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :username, presence: true, length: { minimum: 5 }, uniqueness: true
    validates :password, presence: true, length: { minimum: 5 }
end
