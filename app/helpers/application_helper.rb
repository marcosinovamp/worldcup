module ApplicationHelper
    def bradate(data)
        months = {1=>"janeiro", 2=>"fevereiro", 3=>"março", 4=>"abril", 5=>"maio", 6=>"junho", 7=>"julho", 8=>"agosto", 9=>"setembro", 10=>"outubro", 11=>"novembro", 12=>"dezembro"}
        parts = data.to_s.split('/')
        return "#{parts[0]} de #{months[parts[1].to_i]} de #{parts[2]} às #{parts[3]}:#{parts[4]}"
    end

    def today(data)
        months = {1=>"janeiro", 2=>"fevereiro", 3=>"março", 4=>"abril", 5=>"maio", 6=>"junho", 7=>"julho", 8=>"agosto", 9=>"setembro", 10=>"outubro", 11=>"novembro", 12=>"dezembro"}
        parts = data.to_s.split('/')
        return "#{parts[0]} de #{months[parts[1].to_i]} de #{parts[2]}"
    end

    def horario(data)
        parts = data.to_s.split('/')
        return "#{parts[3]}:#{parts[4]}h"
    end
    
    def denilizador(x)
        if x.nil?
            y = 0
        else
            y = x
        end
        return y
    end

    def projection(sel)
        (3-sel.jg)*3
    end

    def explainer(game)
        groups = {1=>"A", 2=>"B", 3=>"C", 4=>"D", 5=>"E", 6=>"F", 7=>"G", 8=>"H"}
        team1 = game.equipe1.to_s.split("")
        team2 = game.equipe2.to_s.split("")
        if game.grupo_id == 9
            return "#{team1[0]}° do grupo #{groups[team1[1].to_i]} x #{team2[0]}° do grupo #{groups[team2[1].to_i]}"
        else
            if team1[0] == "1"
                return "Vencedor do jogo ##{team1[1]}#{team1[2]} x Vencedor do jogo ##{team2[1]}#{team2[2]}"
            else
                return "Perdedor do jogo ##{team1[1]}#{team1[2]} x Perdedor do jogo ##{team2[1]}#{team2[2]}"
            end
        end
    end
end
