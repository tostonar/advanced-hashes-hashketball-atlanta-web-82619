# Write your code here!
require "pry"

def game_hash
  new_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
          {
            "Alan Anderson" => {
              :number => 0,
              :shoe => 16,
              :points => 22,
              :rebounds => 12,
              :assists => 12,
              :steals => 3,
              :blocks => 1,
              :slam_dunks => 1
            }
          }, {
          "Reggie Evans" => {
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
          }

        }, {
          "Brook Lopez" => {
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
          }

        }, {
          "Mason Plumlee" => {
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 11,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
          }

        }, {
          "Jason Terry" => {
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds => 2,
            :assists => 2,
            :steals => 4,
            :blocks => 11,
            :slam_dunks => 1
          }

        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          "Jeff Adrien" => {
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
          }

      }, {
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        }

      }, {
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        }

      }, {
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        }

      }, {
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }

      }
      ]
    }
  }
end

def num_points_scored(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |member|
      if member.include?(player)
        return member[player][:points]
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |member|
       if member[player]
         return member[player][:shoe]
       end
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
       return team_data[:colors]
    end
  end
end

def team_names
  teams = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        teams.push(data)
      end
    end
  end
  teams
end

def player_numbers(team)
  team_numbers = []
  game_hash.each do |location, team_data|
    #if team name matches given argument
    if team_data[:team_name] == team
      team_data[:players].each do |player|
        player.each do |name, stat|
          team_numbers.push(player[name][:number])
        end
      end
    end
  end
  team_numbers
end

def player_stats(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |member|
       if member[player]
         return member[player]
       end
    end
  end
end

def big_shoe_rebounds
  largest = ""
  shoe_size = 0
  #find player with largest shoe size
  game_hash.each do |location, team_data|
    team_data[:players].each do |member|
      member.each do |name, stats|
        #if this member's shoe size is greater than the current value of shoe_size, then reassign the current shoe size to shoe_size
        if member[name][:shoe] > shoe_size
          shoe_size = member[name][:shoe]
          largest = name
        end
      end
    end
  end
  #return that player's number of rebounds
  return largest_rebounds = player_stats(largest)[:rebounds]
end

def most_points_scored
  most_points_player = ""
  highest_points = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      player.each do |name, stats|
        if player[name][:points] > highest_points
          highest_points = player[name][:points]
          most_points_player = name
        end
      end
    end
  end
  return most_points_player
end

def winning_team
  score1_points = []
  score2_points = []
  game_hash[:home][:players].each do |player|
    player.each do |name, stats|
      score1_points << player[name][:points]
    end
  end
  home_score = score1_points.sum

  game_hash[:away][:players].each do |player|
    player.each do |name, stats|
      score2_points << player[name][:points]
    end
  end
  away_score = score2_points.sum

  home_score > away_score ? game_hash[:home][:team_name] : game_hash[:away][:team_name]  
end

def player_with_longest_name
  longest_name = ""
  longest_name_length = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      player.each do |name, stats|
        if name.length > longest_name_length
          longest_name_length = name.length
          longest_name = name
        end
      end
    end
  end
  return longest_name
end

def long_name_steals_a_ton?
  player_with_most_steals = ""
  most_steals = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      player.each do |name, stats|
        if player[name][:steals] > most_steals
          most_steals = player[name][:steals]
          player_with_most_steals = name
        end
      end
    end
  end
  return player_with_most_steals == player_with_longest_name
end
