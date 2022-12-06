class Confederation < ApplicationRecord
    has_many :selecaos
    has_many :jogadors, through: :selecaos
    has_many :treinadors, through: :selecaos
    has_many :red_cards, through: :jogadors
    has_many :yellow_cards, through: :jogadors
    has_many :eventos, through: :jogadors
    has_many :grupos, through: :selecaos

    def num_selecoes
        self.selecaos.size
    end

    def jogos
        @jog = []
        self.selecaos.each do |s|
            s.jogos.each do |j|
                @jog << j
            end
        end
        return @jog
    end

    def jg
        @jg = 0
        self.selecaos.each do |s|
            @jg += s.jg
        end
        return @jg
    end

    def jg_grupo
        @jg = 0
        self.selecaos.each do |s|
            @jg += s.jg_grupo
        end
        return @jg
    end

    def vt
        @vt = 0
        self.selecaos.each do |s|
            @vt += s.vt
        end
        return @vt
    end

    def vt_grupo
        @vt = 0
        self.selecaos.each do |s|
            @vt += s.vt_grupo
        end
        return @vt
    end

    def ep
        @ep = 0
        self.selecaos.each do |s|
            @ep += s.ep
        end
        return @ep
    end
    
    def ep_grupo
        @ep = 0
        self.selecaos.each do |s|
            @ep += s.ep_grupo
        end
        return @ep
    end

    def dr
        @dr = 0
        self.selecaos.each do |s|
            @dr += s.dr
        end
        return @dr
    end
    
    def dr_grupo
        @dr = 0
        self.selecaos.each do |s|
            @dr += s.dr_grupo
        end
        return @dr
    end

    def pt
        @pt = 0
        self.selecaos.each do |s|
            @pt += s.pt
        end
        return @pt
    end
    
    def pt_grupo
        @pt = 0
        self.selecaos.each do |s|
            @pt += s.pt_grupo
        end
        return @pt
    end

    def gp
        @gol = 0
        self.selecaos.each do |s|
            @gol += s.gp
        end
        return @gol
    end
    
    def gp_grupo
        @gol = 0
        self.selecaos.each do |s|
            @gol += s.gp_grupo
        end
        return @gol
    end

    def gc
        @gol = 0
        self.selecaos.each do |s|
            @gol += s.gc
        end
        return @gol
    end
    
    def gc_grupo
        @gol = 0
        self.selecaos.each do |s|
            @gol += s.gc_grupo
        end
        return @gol
    end

    def sg
        @gol = 0
        self.selecaos.each do |s|
            @gol += s.sg
        end
        return @gol
    end
    
    def sg_grupo
        @gol = 0
        self.selecaos.each do |s|
            @gol += s.sg_grupo
        end
        return @gol
    end

    def ycards
        @card = 0
        self.selecaos.each do |s|
            @card += s.ycards
        end
        return @card
    end
    
    def ycards_grupo
        @card = 0
        self.selecaos.each do |s|
            @card += s.ycards_grupo
        end
        return @card
    end

    def rcards
        @card = 0
        self.selecaos.each do |s|
            @card += s.rcards
        end
        return @card
    end
    
    def rcards_grupo
        @card = 0
        self.selecaos.each do |s|
            @card += s.rcards_grupo
        end
        return @card
    end

end
