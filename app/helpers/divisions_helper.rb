module DivisionsHelper
    def games_played(team)
        team_id = team.id
        games_played = Game.where("home_team_id = ? OR away_team_id = ?", team_id, team_id)
    end

    def goals_scored_against(team)
        team_id = team.id
        total_goals = 0
        games_played(team).each do |game|
            if game.home_team_id == team_id
                total_goals += game.away_team.goals.where(game_id: game.id).count
            else
                total_goals += game.home_team.goals.where(game_id: game.id).count
            end
        end
        total_goals
    end

    def goals_scored_for(team)
        team_id = team.id
        total_goals = 0
        games_played(team).each do |game|
            if game.home_team_id == team_id
                total_goals += game.home_team.goals.where(game_id: game.id).count
            else
                total_goals += game.away_team.goals.where(game_id: game.id).count
            end
        end
        total_goals
    end

    def goal_difference(team)
        goals_scored_for(team) - goals_scored_against(team)
    end

    def games_stats(team)
        team_id = team.id
        game_won = 0
        game_lost = 0
        game_tied = 0
        games_played(team).each do |game|
            home_team_goals = game.home_team.goals.where(game_id: game.id).count
            away_team_goals = game.away_team.goals.where(game_id: game.id).count
            if game.home_team_id == team_id
                if home_team_goals > away_team_goals
                    game_won += 1
                elsif home_team_goals < away_team_goals
                    game_lost += 1
                else
                    game_tied += 1
                end
            else
                if away_team_goals > home_team_goals
                    game_won += 1
                elsif away_team_goals < home_team_goals
                    game_lost += 1
                else
                    game_tied += 1
                end
            end
        end
        game_stats = {wins: game_won, losses: game_lost, ties: game_tied}
    end

    def games_lost(team)
        games_played(team).count - games_won(team)
    end


    # def points(team)
    #     team_id = team.id
    #     points = 0
    #     games_played(team).each do |game|
    #         if game.home_team_id == team_id
    #             if game.home_team_score > game.away_team_score
    #                 points += 3
    #             elsif game.home_team_score == game.away_team_score
    #                 points += 1
    #             end
    #         else
    #             if game.away_team_score > game.home_team_score
    #                 points += 3
    #             elsif game.away_team_score == game.home_team_score
    #                 points += 1
    #             end
    #         end
    #     end
    #     points
    # end

    # def wins(team)
    #     team_id = team.id
    #     wins = 0
    #     games_played(team).each do |game|
    #       if game.home_team == team
    #         home_team_goals = game.goals.where(team: game.home_team).count
    #         away_team_goals = game.goals.where(team: game.away_team).count
    #         if home_team_goals > away_team_goals
    #           wins += 1
    #         end
    #       else
    #         home_team_goals = game.goals.where(team: game.home_team).count
    #         away_team_goals = game.goals.where(team: game.away_team).count
    #         if away_team_goals > home_team_goals
    #           wins += 1
    #         end
    #       end
    #     end
    #     wins
    #   end
      

    # def losses(team)
    #     team_id = team.id
    #     losses = 0
    #     games_played(team).each do |game|
    #         if game.home_team_id == team_id
    #             if game.home_team_score < game.away_team_score
    #                 losses += 1
    #             end
    #         else
    #             if game.away_team_score < game.home_team_score
    #                 losses += 1
    #             end
    #         end
    #     end
    #     losses
    # end

    # def ties(team)
    #     team_id = team.id
    #     ties = 0
    #     games_played(team).each do |game|
    #         if game.home_team_id == team_id
    #             if game.home_team_score == game.away_team_score
    #                 ties += 1
    #             end
    #         else
    #             if game.away_team_score == game.home_team_score
    #                 ties += 1
    #             end
    #         end
    #     end
    #     ties
    # end

end
