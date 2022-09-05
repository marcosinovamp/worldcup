module ApplicationHelper
    def bradate(data)
        months = {1=>"janeiro", 2=>"fevereiro", 3=>"março", 4=>"abril", 5=>"maio", 6=>"junho", 7=>"julho", 8=>"agosto", 9=>"setembro", 10=>"outubro", 11=>"novembro", 12=>"dezembro"}
        parts = data.to_s.split('/')
        return "#{parts[0]} de #{months[parts[1].to_i]} de #{parts[2]} às #{parts[3]}:#{parts[4]}"
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
end
