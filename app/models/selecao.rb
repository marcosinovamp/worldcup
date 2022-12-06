class Selecao < ApplicationRecord
  has_many :grupos
  belongs_to :confederation
  has_many :jogos
  has_one :treinador
  has_many :jogadors
  has_many :yellow_cards, through: :jogadors
  has_many :red_cards, through: :jogadors
  has_many :eventos, through: :jogadors


  def jogos
    Jogo.all.select{|j| j.equipe1 == self.id || j.equipe2 == self.id}
  end

  def jgs_grupo
    self.jogos.select{|j| j.grupo_id <= 8}
  end

  def vt
    @vct = 0
    self.jogos.map { |j|
      if self.id == j.equipe1 && j.started == true && j.g1 > j.g2
        @vct += 1
      elsif self.id == j.equipe2 && j.started == true && j.g2 > j.g1
        @vct += 1
      end
    }
    return @vct
  end

  def vt_grupo
    @vct = 0
    self.jgs_grupo.map { |j|
      if self.id == j.equipe1 && j.started == true && j.g1 > j.g2
        @vct += 1
      elsif self.id == j.equipe2 && j.started == true && j.g2 > j.g1
        @vct += 1
      end
    }
    return @vct
  end

  def ep
    @ept = 0
    self.jogos.map { |j|
      if self.id == j.equipe1 && j.started == true && j.g1 == j.g2
        @ept += 1
      elsif self.id == j.equipe2 && j.started == true && j.g2 == j.g1
        @ept += 1
      end
    }
    return @ept
  end

  def ep_grupo
    @ept = 0
    self.jgs_grupo.map { |j|
      if self.id == j.equipe1 && j.started == true && j.g1 == j.g2
        @ept += 1
      elsif self.id == j.equipe2 && j.started == true && j.g2 == j.g1
        @ept += 1
      end
    }
    return @ept
  end

  def dr
    @drt = 0
    self.jogos.map { |j|
      if self.id == j.equipe1 && j.started == true && j.g1 < j.g2
        @drt += 1
      elsif self.id == j.equipe2 && j.started == true && j.g2 < j.g1
        @drt += 1
      end
    }
    return @drt
  end

  def dr_grupo
    @drt = 0
    self.jgs_grupo.map { |j|
      if self.id == j.equipe1 && j.started == true && j.g1 < j.g2
        @drt += 1
      elsif self.id == j.equipe2 && j.started == true && j.g2 < j.g1
        @drt += 1
      end
    }
    return @drt
  end

  def gp
    @fv = 0
    self.jogos.map { |j|
      if self.id == j.equipe1 && j.g1.nil? == false
        @fv += j.g1
      elsif self.id == j.equipe2 && j.g2.nil? == false
        @fv += j.g2
      end
    }
    return @fv
  end

  def gp_grupo
    @fv = 0
    self.jgs_grupo.map { |j|
      if self.id == j.equipe1 && j.g1.nil? == false
        @fv += j.g1
      elsif self.id == j.equipe2 && j.g2.nil? == false
        @fv += j.g2
      end
    }
    return @fv
  end

  def gc
    @cnt = 0
    self.jogos.map { |j|
      if self.id == j.equipe1 && j.g2.nil? == false
        @cnt += j.g2
      elsif self.id == j.equipe2 && j.g1.nil? == false
        @cnt += j.g1
      end
    }
    return @cnt
  end

  def gc_grupo
    @cnt = 0
    self.jgs_grupo.map { |j|
      if self.id == j.equipe1 && j.g2.nil? == false
        @cnt += j.g2
      elsif self.id == j.equipe2 && j.g1.nil? == false
        @cnt += j.g1
      end
    }
    return @cnt
  end

  def sg
    self.gp - self.gc
  end

  def sg_grupo
    self.gp_grupo - self.gc_grupo
  end

  def pt
    self.vt*3 + self.ep
  end

  def pt_grupo
    self.vt_grupo*3 + self.ep_grupo
  end

  def jg
    self.vt + self.ep + self.dr
  end

  def jg_grupo
    self.vt_grupo + self.ep_grupo + self.dr_grupo
  end

  def ycards
    self.yellow_cards.size + self.treinador.yellow_cards.size
  end

  def ycards_grupo
    self.yellow_cards.select{|yc| yc.jogo_id <= 48}.size + self.treinador.yellow_cards.select{|yc| yc.jogo_id <= 48}.size
  end

  def rcards
    self.red_cards.size + self.treinador.red_cards.size
  end

  def rcards_grupo
    self.red_cards.select{|rc| rc.jogo_id <= 48}.size + self.treinador.red_cards.select{|rc| rc.jogo_id <= 48}.size
  end

end