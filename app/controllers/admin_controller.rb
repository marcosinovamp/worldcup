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
    @jogadores1 = @sel1.jogadors
    @jogadores2 = @sel2.jogadors
    @eventos = @game.eventos
  end

  def started
    @game = Jogo.find(params[:id])
    @game.started = true
    @game.g1 = @game.g1.nil? ? 0 : @game.g1
    @game.g2 = @game.g2.nil? ? 0 : @game.g2
    @game.save
    redirect_back :fallback_location => "/"
  end

  def registro
    @game = Jogo.find(params[:id])
    if params[:marc1].nil? == false
      @game.g1.nil? ? @game.g1 = 1 : @game.g1 += 1
      @game.save
      if params[:marc1].to_i > 0
        @jogador = Jogador.find(params[:marc1])
        @jogador.gols.nil? ? @jogador.gols = 1 : @jogador.gols += 1
        @jogador.save
      end
    elsif params[:marc2].nil? == false
      @game.g2.nil? ? @game.g2 = 1 : @game.g2 += 1
      @game.save
      if params[:marc2].to_i > 0
        @jogador = Jogador.find(params[:marc2])
        @jogador.gols.nil? ? @jogador.gols = 1 : @jogador.gols += 1
        @jogador.save
      end       
    end
    @game.p1 = params[:p1]
    @game.p2 = params[:p2]
    @game.save
    if params[:p1].nil? 
      @evento = Evento.new(tipo:"Gol", jogo_id: @game.id, jogador_id:params[:marc1] == 99 || params[:marc2] == 99 ? 99 : @jogador.id)
      @evento.save
    end
    redirect_back :fallback_location => "/"
  end

  def ycards
    if params[:ycard1].nil? == false
      @ycard = YellowCard.new(jogo_id: params[:id], jogador_id: params[:ycard1])
      @ycard.save
      @evento = Evento.new(tipo: "Cartão Amarelo", jogo_id: params[:id], jogador_id: params[:ycard1])
      @evento.save
    elsif params[:ycard2].nil? == false
      @ycard = YellowCard.new(jogo_id: params[:id], jogador_id: params[:ycard2])
      @ycard.save
      @evento = Evento.new(tipo: "Cartão Amarelo", jogo_id: params[:id], jogador_id: params[:ycard2])
      @evento.save
    end
    redirect_back :fallback_location => "/"
  end

  def rcards
    if params[:rcard1].nil? == false
      @rcard = RedCard.new(jogo_id: params[:id], jogador_id: params[:rcard1])
      @rcard.save
      @evento = Evento.new(tipo: "Cartão Vermelho", jogo_id: params[:id], jogador_id: params[:rcard1])
      @evento.save
    elsif params[:rcard2].nil? == false
      @rcard = RedCard.new(jogo_id: params[:id], jogador_id: params[:rcard2])
      @rcard.save
      @evento = Evento.new(tipo: "Cartão Vermelho", jogo_id: params[:id], jogador_id: params[:rcard2])
      @evento.save
    end
    redirect_back :fallback_location => "/"
  end

  def yctr
    @yc = YellowCard.new(jogo_id: params[:id], treinador_id: params[:coach])
    @yc.save
    @evento = Evento.new(tipo: "Cartão Amarelo", jogo_id: params[:id], treinador_id: params[:coach])
    @evento.save
    redirect_back :fallback_location => "/"
  end

  def rctr
    @rc = RedCard.new(jogo_id: params[:id], treinador_id: params[:coach])
    @rc.save
    @evento = Evento.new(tipo: "Cartão Vermelho", jogo_id: params[:id], treinador_id: params[:coach])
    @evento.save
    redirect_back :fallback_location => "/"
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
    if params[:data].nil?
      @dia = Date.current
    else
      @dia = Date.current + params[:data].to_i
    end
    @hoje = Jogo.all.select{ |j| j.data.to_date == @dia}
    @jogadores = Jogador.all
    @antes = (-30..-4).to_a
    @depois = (4..30).to_a
    @semana = {0 => "Domingo", 1 => "Segunda-feira", 2 => "Terça-feira", 3 => "Quarta-feira", 4 => "Quinta-feira", 5 => "Sexta-feira", 6 => "Sábado"}
  end
  

  def estatisticas
    @best_attack = Selecao.all.select{|sl| sl.jg > 0 }.sort_by{|s| s.gp*-1}
    @best_defence = Selecao.all.select{|sl| sl.jg > 0 }.sort_by{|s| s.gc}
    @greater_sg = Selecao.all.select{|sl| sl.jg > 0 }.sort_by{|s| s.sg*-1}
    @most_ycards = Selecao.all.select{|sl| sl.jg > 0 }.sort_by{|s| s.yellow_cards.size*-1}
    @most_rcards = Selecao.all.select{|sl| sl.jg > 0 }.sort_by{|s| s.red_cards.size*-1}
    @golspro = []
    @golscontra = []
    @yellow = []
    @red = []
    @fairplay = []
    Selecao.all.each do |s|
      @golspro << s.gp
      @golscontra << s.gc
      @yellow << s.yellow_cards.size
      @red << s.red_cards.size
      @fairplay << (s.yellow_cards.size + s.red_cards.size*2)
    end
    @sel_conc = Selecao.all.select{|s| s.jg > 0}
    @golspro = @golspro.uniq.sort
    @max_gp = @golspro.max
    @max_gp2 = @golspro[-2]
    @max_gp3 = @golspro[-3]
    @min_gp = @golspro.min
    @min_gp2 = @golspro[1]
    @min_gp3 = @golspro[2]
    @bas = @sel_conc.select{|s| s.gp == @max_gp}
    @bas2 = @sel_conc.select{|s| s.gp == @max_gp2}
    @bas3 = @sel_conc.select{|s| s.gp == @max_gp3}
    @was = @sel_conc.select{|s| s.gp == @min_gp}
    @was2 = @sel_conc.select{|s| s.gp == @min_gp2}
    @was3 = @sel_conc.select{|s| s.gp == @min_gp3}
    @golscontra = @golscontra.uniq.sort
    @max_gc = @golscontra.max
    @max_gc2 = @golscontra[-2]
    @max_gc3 = @golscontra[-3]
    @min_gc = @golscontra.min
    @min_gc2 = @golscontra[1]
    @min_gc3 = @golscontra[2]
    @bds = @sel_conc.select{|s| s.gc == @min_gc}
    @bds2 = @sel_conc.select{|s| s.gc == @min_gc2}
    @bds3 = @sel_conc.select{|s| s.gc == @min_gc3}
    @wds = @sel_conc.select{|s| s.gc == @max_gc}
    @wds2 = @sel_conc.select{|s| s.gc == @max_gc2}
    @wds3 = @sel_conc.select{|s| s.gc == @max_gc3}
    @played_games = Jogo.all.select{|j| j.started == true}
    @draws = @played_games.select{|jg| jg.g1 == jg.g2}
    @goals_total = 0
    @played_games.each do |jg|
      @goals_total += (jg.g1 + jg.g2)
    end
    @goals_avg = (@goals_total.to_f/@played_games.size).round(2)
    @most_goals_game = Jogo.all.select{|jg| jg.started == true}.sort_by{|s| (s.g1 + s.g2)*-1}.first
    @selmost1 = Selecao.find(@most_goals_game.equipe1)
    @selmost2 = Selecao.find(@most_goals_game.equipe2)
    @yellow = @yellow.uniq.sort
    @max_yc = @yellow.max
    @max_yc2 = @yellow[-2]
    @max_yc3 = @yellow[-3]
    @myc = @sel_conc.select{|s| s.yellow_cards.size == @max_yc}
    @myc2 = @sel_conc.select{|s| s.yellow_cards.size == @max_yc2}
    @myc3 = @sel_conc.select{|s| s.yellow_cards.size == @max_yc3}
    @red = @red.uniq.sort
    @max_rc = @red.max
    @max_rc2 = @red[-2]
    @max_rc3 = @red[-3]
    @mrc = @sel_conc.select{|s| s.red_cards.size == @max_rc && s.red_cards.size > 0}
    @mrc2 = @sel_conc.select{|s| s.red_cards.size == @max_rc2 && s.red_cards.size > 0}
    @mrc3 = @sel_conc.select{|s| s.red_cards.size == @max_rc3 && s.red_cards.size > 0}
    @fairplay = @fairplay.uniq.sort
    @min_fp = @fairplay.min
    @min_fp2 = @fairplay[1]
    @min_fp3 = @fairplay[2]
    @bfp = @sel_conc.select{|s| (s.yellow_cards.size + s.red_cards.size*2) == @min_fp}
    @bfp2 = @sel_conc.select{|s| (s.yellow_cards.size + s.red_cards.size*2) == @min_fp2}
    @bfp3 = @sel_conc.select{|s| (s.yellow_cards.size + s.red_cards.size*2) == @min_fp3}
  end

  def cgeral
    definições_fase_grupos
  end

  def confclass
    definições_fase_grupos
  end

  def artilheiros
    @jogadores = Jogador.all.sort_by{|j| [j.gols*-1, j.nome]}
    @jogcards = Jogador.all.sort_by{|j| (j.red_cards.size*2 + j.yellow_cards.size)*-1}
  end

  def rascunho
    @best_attack = Selecao.all.select{|sl| sl.jg > 0 }.sort_by{|s| s.gp*-1}
    @best_defence = Selecao.all.select{|sl| sl.jg > 0 }.sort_by{|s| s.gc}
    @greater_sg = Selecao.all.select{|sl| sl.jg > 0 }.sort_by{|s| s.sg*-1}
    @most_ycards = Selecao.all.select{|sl| sl.jg > 0 }.sort_by{|s| s.yellow_cards.size*-1}
    @most_rcards = Selecao.all.select{|sl| sl.jg > 0 }.sort_by{|s| s.red_cards.size*-1}
    @golspro = []
    @golscontra = []
    @yellow = []
    @red = []
    @fairplay = []
    Selecao.all.each do |s|
      @golspro << ((s.gp.to_f/s.jg)*100).round(2)
      @golscontra << ((s.gc.to_f/s.jg)*100).round(2)
      @yellow << ((s.yellow_cards.size.to_f/s.jg)*100).round(2)
      @red << ((s.red_cards.size.to_f/s.jg)*100).round(2)
      @fairplay << ((s.yellow_cards.size + s.red_cards.size*2).to_f/s.jg)*100.round(2)
    end
    @sel_conc = Selecao.all.select{|s| s.jg > 0}
    @golspro = @golspro.uniq.sort
    @max_gp = @golspro.max
    @max_gp2 = @golspro[-2]
    @max_gp3 = @golspro[-3]
    @min_gp = @golspro.min
    @min_gp2 = @golspro[1]
    @min_gp3 = @golspro[2]
    @bas = @sel_conc.select{|s| ((s.gp.to_f/s.jg)*100).round(2) == @max_gp}
    @bas2 = @sel_conc.select{|s| ((s.gp.to_f/s.jg)*100).round(2) == @max_gp2}
    @bas3 = @sel_conc.select{|s| ((s.gp.to_f/s.jg)*100).round(2) == @max_gp3}
    @was = @sel_conc.select{|s| ((s.gp.to_f/s.jg)*100).round(2) == @min_gp}
    @was2 = @sel_conc.select{|s| ((s.gp.to_f/s.jg)*100).round(2) == @min_gp2}
    @was3 = @sel_conc.select{|s| ((s.gp.to_f/s.jg)*100).round(2) == @min_gp3}
    @golscontra = @golscontra.uniq.sort
    @max_gc = @golscontra.max
    @max_gc2 = @golscontra[-2]
    @max_gc3 = @golscontra[-3]
    @min_gc = @golscontra.min
    @min_gc2 = @golscontra[1]
    @min_gc3 = @golscontra[2]
    @bds = @sel_conc.select{|s| ((s.gc.to_f/s.jg)*100).round(2) == @min_gc}
    @bds2 = @sel_conc.select{|s| ((s.gc.to_f/s.jg)*100).round(2) == @min_gc2}
    @bds3 = @sel_conc.select{|s| ((s.gc.to_f/s.jg)*100).round(2) == @min_gc3}
    @wds = @sel_conc.select{|s| ((s.gc.to_f/s.jg)*100).round(2) == @max_gc}
    @wds2 = @sel_conc.select{|s| ((s.gc.to_f/s.jg)*100).round(2) == @max_gc2}
    @wds3 = @sel_conc.select{|s| ((s.gc.to_f/s.jg)*100).round(2) == @max_gc3}
    @played_games = Jogo.all.select{|j| j.started == true}
    @draws = @played_games.select{|jg| jg.g1 == jg.g2}
    @goals_total = 0
    @played_games.each do |jg|
      @goals_total += (jg.g1 + jg.g2)
    end
    @goals_avg = (@goals_total.to_f/@played_games.size).round(2)
    @most_goals_game = Jogo.all.select{|jg| jg.started == true}.sort_by{|s| (s.g1 + s.g2)*-1}.first
    @selmost1 = Selecao.find(@most_goals_game.equipe1)
    @selmost2 = Selecao.find(@most_goals_game.equipe2)
    @yellow = @yellow.uniq.sort
    @max_yc = @yellow.max
    @max_yc2 = @yellow[-2]
    @max_yc3 = @yellow[-3]
    @myc = @sel_conc.select{|s| ((s.yellow_cards.size.to_f/s.jg)*100).round(2) == @max_yc}
    @myc2 = @sel_conc.select{|s| ((s.yellow_cards.size.to_f/s.jg)*100).round(2) == @max_yc2}
    @myc3 = @sel_conc.select{|s| ((s.yellow_cards.size.to_f/s.jg)*100).round(2) == @max_yc3}
    @red = @red.uniq.sort
    @max_rc = @red.max
    @max_rc2 = @red[-2]
    @max_rc3 = @red[-3]
    @mrc = @sel_conc.select{|s| ((s.red_cards.size.to_f/s.jg)*100).round(2) == @max_rc && s.red_cards.size > 0}
    @mrc2 = @sel_conc.select{|s| ((s.red_cards.size.to_f/s.jg)*100).round(2) == @max_rc2 && s.red_cards.size > 0}
    @mrc3 = @sel_conc.select{|s| ((s.red_cards.size.to_f/s.jg)*100).round(2) == @max_rc3 && s.red_cards.size > 0}
    @fairplay = @fairplay.uniq.sort
    @min_fp = @fairplay.min
    @min_fp2 = @fairplay[1]
    @min_fp3 = @fairplay[2]
    @bfp = @sel_conc.select{|s| ((s.yellow_cards.size + s.red_cards.size*2).to_f/s.jg)*100.round(2) == @min_fp}
    @bfp2 = @sel_conc.select{|s| ((s.yellow_cards.size + s.red_cards.size*2).to_f/s.jg)*100.round(2) == @min_fp2}
    @bfp3 = @sel_conc.select{|s| ((s.yellow_cards.size + s.red_cards.size*2).to_f/s.jg)*100.round(2) == @min_fp3}
  end

  private

  def definições_fase_grupos
    @selecaos = Selecao.all
    @conf = Confederation.all.select {|c| c.selecaos.size > 0}
    @grupos = Grupo.all.select {|g| g.selecaos.size > 0}
  end

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
    @sub = grupo.selecaos.sort_by{ |t| [denilizador(t.pt)*-1, denilizador(t.sg)*-1, denilizador(t.gp)*-1, denilizador(t.ycards)]}
    if @sub.first.jg == 3 && @sub.second.jg == 3 && @sub.third.jg == 3 && @sub.fourth.jg == 3
      @c1 = @sub.first
      @c2 = @sub.second
      grupo.jogos.each do |j|
        if j.equipe1 == "1#{grupo.id}0".to_i
          j.equipe1 = @c1.id
          j.save
        elsif j.equipe1 == "2#{grupo.id}0".to_i
          j.equipe1 = @c2.id
          j.save
        end
        if j.equipe2 == "1#{grupo.id}0".to_i
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
        if Jogo.find(@in).started == true
          j.equipe1 = Jogo.find(@in).winner
          j.save
        end
      end
      if j.equipe2 > 100
        @in2 = j.equipe2 - 100
        if Jogo.find(@in2).started == true
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
        if Jogo.find(@in).started == true
          j.equipe1 = Jogo.find(@in).winner
          j.save
        end
      end
      if j.equipe2 > 100
        @in2 = j.equipe2 - 100
        if Jogo.find(@in2).started == true
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
      if Jogo.find(@in).started == true
        @final.equipe1 = Jogo.find(@in).winner
        @terceiro.equipe1 = Jogo.find(@in).loser
        @final.save
        @terceiro.save
      end
    end
    if @final.equipe2 > 100
      @in2 = @final.equipe2 - 100
      if Jogo.find(@in2).started == true
        @final.equipe2 = Jogo.find(@in2).winner
        @terceiro.equipe2 = Jogo.find(@in2).loser
        @final.save
        @terceiro.save
      end
    end
  end

end
