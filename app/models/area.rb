class Area < ApplicationRecord
  validates :name, presence: { message: "^El nombre no puede estar vacío" }, length: { minimum: 3, message: "^El nombre no puede contener menos de 3 caracteres" }
  validates :cost_center, numericality: { only_integer: true, message: "^El centro de costos no tiene un formato válido" }
  has_many :employees, dependent: :restrict_with_error
end
