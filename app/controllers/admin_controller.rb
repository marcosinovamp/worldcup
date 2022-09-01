class AdminController < ApplicationController
  def home
    @selecaos = Selecao.all
    @conf = Confederation.all.select {|c| c.selecaos.size > 0}
    @grupos = Grupo.all.select {|g| g.selecaos.size > 0}
  end

  def classificacao
  end

  def tabela
  end

  def estatisticas
  end
end
