class Jogador < ApplicationRecord
    belongs_to :selecao
    has_many :yellow_cards
    has_many :red_cards
    # validates :nome, :presence => true
    # validates :nome, :uniqueness => true
    # validates_with NumberValidator
end

# class NumberValidator < ActiveModel::Validator
#     def validate(record)
#         @numbers = []
#         Selecao.find(record.selecao_id).jogadors each do |j|
#             @numbers << j.number
#         end
#         if @numbers.include?(record.number)
#             record.errors[:base] << "O número já existe na seleção escolhida"
#         end
#     end
# end