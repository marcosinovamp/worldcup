class AdminController < ApplicationController
  def home
    definições_fase_grupos
  end

  def classificacao
    definições_fase_grupos
    @gpclass = @grupos.select{|gp| gp.nome.length == 1}
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

  private

  def definições_fase_grupos
    @selecaos = Selecao.all
    @conf = Confederation.all.select {|c| c.selecaos.size > 0}
    @grupos = Grupo.all.select {|g| g.selecaos.size > 0}
  end

end
