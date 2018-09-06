class Tarea < ApplicationRecord

    has_many :completados
    has_many :usuarios, through: :completados
end
