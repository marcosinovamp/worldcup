class Jogo < ApplicationRecord
    belongs_to :grupo
    has_many :selecaos

    def selecaos
        [Selecao.find(equipe1).nome, Selecao.find(equipe2).nome]
    end

    def selecao1
        Selecao.find(equipe1).nome
    end

    def selecao2
        Selecao.find(equipe2).nome
    end
end
