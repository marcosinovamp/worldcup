class Treinador < ApplicationRecord
    belongs_to :selecao
    # validates :nome, :presence => true
    # validates :selecao_id, :presence => true
    # validates :nome, :uniqueness => true
end
