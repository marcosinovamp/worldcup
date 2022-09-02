module ApplicationHelper
    def bradate(data)
        months = ["janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "setembro", "outubro", "novembro", "dezembro"]
        parts = data.to_s.split('/')
        return "#{parts[0]} de #{months[parts[1].to_i]} de #{parts[2]} às #{parts[3]}:#{parts[4]}"
    end
end
