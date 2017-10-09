class Employee < ApplicationRecord
  attr_accessor :remember_token
  belongs_to :area
  validates :area_id, presence: true
  validates :name, presence: { message: "^El nombre no puede estar vacío" }, length: { minimum: 10, message: "^El nombre no puede contener menos de 10 caracteres" }
  validates :username, presence: { message: "^El nombre de usuario no puede estar vacío" }, length: { minimum: 5, message: "^El nombre de usuario no puede contener menos de 5 caracteres" }, uniqueness: { message: "^Este nombre de usuario ya se está utilizando"}
  validates :staff_id, numericality: { only_integer: true, message: "^El Staff ID no tiene un formato válido" }, length: { minimum: 5, message: "^El staff ID no puede contener menos de 5 caracteres" }
  validates :extension, numericality: { only_integer: true, message: "^La extensión no tiene un formato válido" }, allow_blank: true
  validates :cell_phone, numericality: { only_integer: true, message: "^El número celular no tiene un formato válido" }, allow_blank: true
  validates_email_format_of :email, :message => "^El correo electrónico no tiene un formato válido", presence: { message: "^El correo electrónico no puede estar vacío" }
  validates_uniqueness_of :email, :message => "^El correo electrónico ya está siendo utilizado"
  has_secure_password
  validates :password, length: { minimum: 4, maximum: 6 }

  # Returns the hash digest of the given string.
  def Employee.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
               BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def Employee.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = Employee.new_token
        update_attribute(:remember_digest, Employee.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

end
