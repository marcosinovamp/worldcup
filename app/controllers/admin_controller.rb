class AdminController < ApplicationController
  def home
    @selecaos = Selecao.all
    @conf = Confederation.all.select {|c| c.selecaos.size > 0}
    @grupos = Grupo.all.select {|g| g.selecaos.size > 0}
  end

  def classificacao
  end

  def tabela
    @grupos = Grupo.all
    @jogos = Jogo.all
    @selecaos = Selecao.all
    @id_selecaos = []
    @selecaos.each do |s|
      @id_selecaos << s.id
    end
  end

  def estatisticas
  end
end
