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

  def resultado
    @game = Jogo.find(params[:id])
    @sel1 = Selecao.find(@game.equipe1)
    @sel2 = Selecao.find(@game.equipe2)
  end

  def registro
    @game = Jogo.find(params[:id])
    @game.g1 =params[:g1]
    @game.g2 = params[:g2]
    @game.p1 = params[:p1]
    @game.p2 = params[:p2]
    @game.save
    # @game.update(jogo_params)
    redirect_to jogos_path
  end

  def estatisticas
  end

  private

  def definições_fase_grupos
    @selecaos = Selecao.all
    @conf = Confederation.all.select {|c| c.selecaos.size > 0}
    @grupos = Grupo.all.select {|g| g.selecaos.size > 0}
  end

  private

  def jogo_params
    params.require(:jogo).permit(:equipe1, :equipe2, :g1, :g2, :p1, :p2)
  end

end
