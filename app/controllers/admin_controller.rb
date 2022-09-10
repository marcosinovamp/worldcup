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
    @gpclass = @grupos.select{|gp| gp.nome.length == 1}
    @gpclass.each do |g|
      oitavas(g)
    end
    quartas
    semi
    final
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
    redirect_to jogos_path
  end

  def selecao
    @selecao = Selecao.find(params[:id])
    @jogadores = @selecao.jogadors
    @posic = {}
    @posic["Goleiro"] = 1 
    @posic["Lateral Esquerdo"] = 2
    @posic["Zagueiro"] = 3
    @posic["Lateral Direito"] = 4
    @posic["Meio-de-Campo"] = 5
    @posic["Atacante"] = 6
    @stat = {}
    @stat["capitao"] = 1
    @stat["titular"] = 1
    @stat["reserva"] = 2
  end

  def hoje
    @dia = Date.current
    @hoje = Jogo.all.select{ |j| j.data.to_date == @dia}
    @jogadores = Jogador.all
  end
  

  def estatisticas
    definições_fase_grupos
    @finals = []
    @semi = []
    @quartas = []
    @oitavas =[]
    Grupo.find(12).jogos.each do |j|
      @finals << j.equipe1
      @finals << j.equipe2
    end
    Grupo.find(11).jogos.each do |j|
      @semi << j.equipe1
      @semi << j.equipe2
    end
    Grupo.find(10).jogos.each do |j|
      @quartas << j.equipe1
      @quartas << j.equipe2
    end
    Grupo.find(9).jogos.each do |j|
      @oitavas << j.equipe1
      @oitavas << j.equipe2
    end
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

  def denilizador(x)
    if x.nil?
        y = 0
    else
        y = x
    end
    return y
  end

  def oitavas(grupo)
    @sub = grupo.selecaos.sort_by{ |t| [denilizador(t.pt)*-1, denilizador(t.sg)*-1, denilizador(t.gp)*-1]}
    if @sub.first.jg == 3 && @sub.second.jg == 3 && @sub.third.jg == 3 && @sub.fourth.jg == 3
      @c1 = @sub.first
      @c2 = @sub.second
      Jogo.all.each do |j|
        if j.equipe1 == "1#{grupo.id}0".to_i
          j.equipe1 = @c1.id
          j.save
        elsif j.equipe1 == "2#{grupo.id}0".to_i
          j.equipe1 = @c2.id
          j.save
        elsif j.equipe2 == "1#{grupo.id}0".to_i
          j.equipe2 = @c1.id
          j.save
        elsif j.equipe2 == "2#{grupo.id}0".to_i
          j.equipe2 = @c2.id
          j.save
        end
      end
    end
  end

  def quartas
    Grupo.find(10).jogos.each do |j|
      if j.equipe1 > 100
        @in = j.equipe1 - 100
        if Jogo.find(@in).winner != "A definir"
          j.equipe1 = Jogo.find(@in).winner
          j.save
        end
      end
      if j.equipe2 > 100
        @in2 = j.equipe2 - 100
        if Jogo.find(@in2).winner != "A definir"
          j.equipe2 = Jogo.find(@in2).winner
          j.save
        end
      end
    end
  end

  def semi
    Grupo.find(11).jogos.each do |j|
      if j.equipe1 > 100
        @in = j.equipe1 - 100
        if Jogo.find(@in).winner != "A definir"
          j.equipe1 = Jogo.find(@in).winner
          j.save
        end
      end
      if j.equipe2 > 100
        @in2 = j.equipe2 - 100
        if Jogo.find(@in2).winner != "A definir"
          j.equipe2 = Jogo.find(@in2).winner
          j.save
        end
      end
    end
  end

  def final
    @final = Jogo.find(64)
    @terceiro = Jogo.find(63)
    if @final.equipe1 > 100
      @in = @final.equipe1 - 100
      if Jogo.find(@in).winner != "A definir"
        @final.equipe1 = Jogo.find(@in).winner
        @terceiro.equipe1 = Jogo.find(@in).loser
        @final.save
        @terceiro.save
      end
    end
    if @final.equipe2 > 100
      @in2 = @final.equipe2 - 100
      if Jogo.find(@in2).winner != "A definir"
        @final.equipe2 = Jogo.find(@in2).winner
        @terceiro.equipe2 = Jogo.find(@in2).loser
        @final.save
        @terceiro.save
      end
    end
  end

end
