
class BoardCase

    attr_accessor :case

    def initialize(newcase)
        @case = newcase
        
    end
end

class Board

    def initialize
        @case1 = BoardCase.new(1)
        @case2 = BoardCase.new(2)
        @case3 = BoardCase.new(3)
        @case4 = BoardCase.new(4)
        @case5 = BoardCase.new(5)
        @case6 = BoardCase.new(6)
        @case7 = BoardCase.new(7)
        @case8 = BoardCase.new(8)
        @case9 = BoardCase.new(9)
        
        @@cases_value_array = [@case1.case, @case2.case, @case3.case, @case4.case, @case5.case, @case6.case, @case7.case, @case8.case, @case9.case]
    end

    def change_case (new_value)
        compteur = 0
            while compteur == 0
            selected_character = gets.chomp.to_i
                if @@cases_value_array.include?(selected_character) == false
                puts "Erreur de saisie, retape un numéro de case qui n'a pas été attribué"

                else
                compteur += 1
                @@cases_value_array[selected_character-1] = new_value
                end
            end
        return selected_character
    end

    def print_board 
        puts "#{@@cases_value_array[0]} | #{@@cases_value_array[1]} | #{@@cases_value_array[2]}"
        puts "----------"
        puts "#{@@cases_value_array[3]} | #{@@cases_value_array[4]} | #{@@cases_value_array[5]}"
        puts "----------"
        puts "#{@@cases_value_array[6]} | #{@@cases_value_array[7]} | #{@@cases_value_array[8]}"
    end
end

class Player
    attr_accessor :nom, :array_player
    def initialize(nom)
        @nom = nom
        @array_player = []
    end

    def valeurs_player (value)
        @array_player<<value
    end

    def self.conditions_victoire (array)
        if array.include?(1) && array.include?(2) && array.include?(3)
            return true
        
        elsif array.include?(4) && array.include?(5) && array.include?(6)
            return true
        
        elsif array.include?(7) && array.include?(8) && array.include?(9)
            return true
        
        elsif array.include?(1) && array.include?(4) && array.include?(7)
            return true

        elsif array.include?(2) && array.include?(5) && array.include?(8)
            return true
        
        elsif array.include?(3) && array.include?(6) && array.include?(9)
            return true
        
        elsif array.include?(1) && array.include?(5) && array.include?(9)
            return true
        
        elsif array.include?(3) && array.include?(5) && array.include?(7)
            return true
        
        else 
            return false
        end
    end
end


class Game
    
    def initialize (vict1=0, vict2=0)
        puts "Bienvenue dans ce morpion codé avec le cul"
        puts "Score joueur 1: #{vict1} - Score joueur 2: #{vict2}"
        puts "Player 1, enter name"
        nom1 = gets.chomp
        @player1 = Player.new(nom1)

        puts "Player 2, enter name"
        nom2 = gets.chomp
        @player2= Player.new(nom2)
        puts "Salut #{@player1.nom} et #{@player2.nom}"
        
        nouveau_board = Board.new
        nouveau_board.print_board
        
        n=9
        loop do

            puts "#{@player1.nom}, tu as les symboles X, sélectionne une case entre 1 et 9"

            @player1.valeurs_player(nouveau_board.change_case("X"))
            nouveau_board.print_board
            n -= 1 

                if Player.conditions_victoire(@player1.array_player) == true
                puts "Félicitations #{@player1.nom} tu as gagné"
                vict1 += 1
                break
                end
            
                if n==0
                    puts "Vous avez fait match nul"
                    break
                    end

            puts "#{@player2.nom}, tu as les symboles O, sélectionne une case entre 1 et 9"

            @player2.valeurs_player(nouveau_board.change_case("O"))
            nouveau_board.print_board
            n -= 1 

                if Player.conditions_victoire(@player2.array_player) == true
                puts "Félicitations #{@player2.nom} tu as gagné"
                vict2 += 1
                break
                end

                if n==0
                    puts "Vous avez fait match nul"
                    break
                    end
        end

        puts "Voulez vous rejouer? Tapez Y/N"
        
        def test_end(vict1,vict2)
            a = gets.chomp.capitalize
            if a == "Y"
                initialize(vict1,vict2)
            
            elsif  
                a == "N"

            else 
                puts "Apprends à écrire Y OU N!!!!!!!!"
                test_end
            end
        end
        test_end(vict1,vict2)
    end  
end

Game.new