class Api::V1::GamesController < ApplicationController

    def index 
        games = Game.all
        render json: GameSerializer.new(games)
    end

    def create 
        @game = Game.new(game_params)
        if game.save
            render json: game, status: :accepted
        else   
            render json: {errors: game.errors.full_messages}, status: :unprocessable_entity

        end
    end

    # def scoreboard 
    #     games = Game.all
    #     high_score = games.sort_by {|s| game[:score]}.last
    #     low_score = games.sort_by {|s| game[:score]}.first
    #     render json: scoreboard
    # end

    private

    def game_params
        params.require(:game).permit(:score, :player_id)
    end

end
