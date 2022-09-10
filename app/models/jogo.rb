class Jogo < ApplicationRecord
    belongs_to :grupo
    has_many :selecaos
    has_many :yellow_cards
    has_many :red_cards
    # validates :equipe1, :presence => true
    # validates :equipe1, :numericality => { :only_integer => true }
    # validates :equipe2, :presence => true
    # validates :equipe2, :numericality => { :only_integer => true }
    # validates :data, :presence => true

    def selecaos
        [Selecao.find(equipe1).nome, Selecao.find(equipe2).nome]
    end

    def selecao1
        Selecao.find(equipe1).nome
    end

    def selecao2
        Selecao.find(equipe2).nome
    end

    def winner
        if self.g1.nil? == false && self.g2.nil? == false
            if self.g1 == self.g2
                if self.p1.nil? == false && self.p2.nil? == false
                    if self.p1 > self.p2
                        return self.equipe1
                    else
                        return self.equipe2
                    end
                else
                    return "A definir"
                end
            elsif self.g1 > self.g2
                return self.equipe1
            elsif self.g2 > self.g1
                return self.equipe2
            end
        else
            return "A definir"
        end
    end

    def loser
        if self.g1.nil? == false && self.g2.nil? == false
            if self.g1 == self.g2
                if self.p1.nil? == false && self.p2.nil? == false
                    if self.p1 > self.p2
                        return self.equipe2
                    else
                        return self.equipe1
                    end
                else
                    return "A definir"
                end
            elsif self.g1 > self.g2
                return self.equipe2
            elsif self.g2 > self.g1
                return self.equipe1
            end
        else
            return "A definir"
        end
    end

end
