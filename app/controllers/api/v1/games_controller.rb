class Api::V1::GamesController < ApplicationController

    def index 
        games = Game.all.includes(:player)
        high_score = games.sort_by {|score| score[:score]}.reverse
        render json: GameSerializer.new(high_score)
    end

    def create 
        game = Game.new(game_params)
        if game.save
            render json: GameSerializer.new(game), status: :accepted
        else   
            render json: {errors: game.errors.full_messages}, status: :unprocessable_entity
        end
    end


    private

    def game_params
        params.require(:game).permit(:score, :player_id)
    end

end
