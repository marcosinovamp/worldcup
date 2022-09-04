class Selecao < ApplicationRecord
  has_many :grupos
  belongs_to :confederation
  has_many :jogos
  
  def jogos
    Jogo.all.select{|j| j.equipe1 == self.id || j.equipe2 == self.id}
  end

  def vt
    self.jogos.map { |j|
      @vct = 0
      if self.id == j.equipe1 && j.g1.nil? == false && j.g2.nil? == false && j.g1 > j.g2
        @vct += 1
      elsif self.id == j.equipe2 && j.g1.nil? == false && j.g2.nil? == false && j.g2 > j.g1
        @vct += 1
      end
      return @vct
    }
  end

  def ep
    self.jogos.map { |j|
      @ept = 0
      if self.id == j.equipe1 && j.g1.nil? == false && j.g2.nil? == false && j.g1 == j.g2
        @ept += 1
      elsif self.id == j.equipe2 && j.g1.nil? == false && j.g2.nil? == false && j.g2 == j.g1
        @ept += 1
      end
      return @ept
    }
  end

  def dr
    self.jogos.map { |j|
      @drt = 0
      if self.id == j.equipe1 && j.g1.nil? == false && j.g2.nil? == false && j.g1 < j.g2
        @drt += 1
      elsif self.id == j.equipe2 && j.g1.nil? == false && j.g2.nil? == false && j.g2 < j.g1
        @drt += 1
      end
      return @drt
    }
  end

  def gp
    self.jogos.map { |j|
      @fv = 0
      if self.id == j.equipe1 && j.g1.nil? == false
        @fv += j.g1
      elsif self.id == j.equipe2 && j.g2.nil? == false
        @fv += j.g2
      end
      return @fv
    }
  end

  def gc
    self.jogos.map { |j|
      @cnt = 0
      if self.id == j.equipe1 && j.g2.nil? == false
        @cnt += j.g2
      elsif self.id == j.equipe2 && j.g1.nil? == false
        @cnt += j.g1
      end
      return @cnt
    }
  end

  def pt
    self.vt*3 + self.ep
  end

  def jg
    self.vt + self.ep + self.dr
  end

  def sg
    self.gp - self.gc
  end

end