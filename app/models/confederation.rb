class Confederation < ApplicationRecord
    has_many :selecaos
    # validates :nome, :presence => true
    # validates :nome, :uniqueness => true
end
