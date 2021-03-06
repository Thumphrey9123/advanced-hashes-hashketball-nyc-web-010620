require 'pp'
require 'pry'
def game_hash
 {
    :home => {
      :team_name => 'Brooklyn Nets',
      :colors => ["Black", "White"],
      :players => [{
    :player_name => 'Alan Anderson',
    :number => 0,
    :shoe => 16,
    :points => 22,
    :rebounds => 12,
    :assists => 12,
    :steals => 3,
    :blocks => 1,
    :slam_dunks => 1
  }, {
    :player_name => 'Reggie Evans',
    :number => 30,
    :shoe => 14,
    :points => 12,
    :rebounds => 12,
    :assists => 12,
    :steals => 12,
    :blocks => 12,
    :slam_dunks => 7
  }, {
    :player_name => "Brook Lopez",
    :number => 11,
    :shoe => 17,
    :points => 17,
    :rebounds => 19,
    :assists => 10,
    :steals => 3,
    :blocks => 1,
    :slam_dunks => 15
  }, {
    :player_name => "Mason Plumlee",
    :number => 1,
    :shoe => 19,
    :points => 26,
    :rebounds => 11,
    :assists => 6,
    :steals => 3,
    :blocks => 8,
    :slam_dunks => 5
  }, {
    :player_name => "Jason Terry",
    :number => 31,
    :shoe => 15,
    :points => 19,
    :rebounds => 2,
    :assists => 2,
    :steals => 4,
    :blocks => 11,
    :slam_dunks => 1
  }]
    },
    :away => {
      :team_name => 'Charlotte Hornets',
      :colors => ["Turquoise", "Purple"],
      :players => [{
    :player_name => "Jeff Adrien",
    :number => 4,
    :shoe => 18,
    :points => 10,
    :rebounds => 1,
    :assists => 1,
    :steals => 2,
    :blocks => 7,
    :slam_dunks => 2
  }, {
    :player_name => "Bismack Biyombo",
    :number => 0,
    :shoe => 16,
    :points => 12,
    :rebounds => 4,
    :assists => 7,
    :steals => 22,
    :blocks => 15,
    :slam_dunks => 10
  }, {
    :player_name => "DeSagna Diop",
    :number => 2,
    :shoe => 14,
    :points => 24,
    :rebounds => 12,
    :assists => 12,
    :steals => 4,
    :blocks => 5,
    :slam_dunks => 5
  }, {
    :player_name => "Ben Gordon",
    :number => 8,
    :shoe => 15,
    :points => 33,
    :rebounds => 3,
    :assists => 2,
    :steals => 1,
    :blocks => 1,
    :slam_dunks => 0
  }, {
    :player_name => "Kemba Walker",
    :number => 33,
    :shoe => 15,
    :points => 6,
    :rebounds => 12,
    :assists => 12,
    :steals => 7,
    :blocks => 5,
    :slam_dunks => 12
  }]
    }
  }
end



def num_points_scored(name)
  game_hash.each do|place, team| 
    team.each do|attribute, data| 
      if attribute == :players
      data.each do |player|
          if player[:player_name] == name
            return player[:points]
          end
        end
      end
    end
  end
end

def shoe_size(name)
   game_hash.each do|place, team| 
    team.each do|attribute, data| 
      if attribute == :players
      data.each do |player|
          if player[:player_name] == name
            return player[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
   game_hash.each do|place, team| 
    if team[:team_name] == team_name
      team.each do|attribute, data| 
        if attribute == :colors
          return data
        end
      end
    end
  end
end


def team_names
  arr = []
  game_hash.each do |place,team|
    arr << team[:team_name]
  end
  arr
end

def player_numbers(team_name)
arr = []
game_hash.each do|place, team| 
    if team[:team_name] == team_name
      team.each do|attribute, data| 
        if attribute == :players
        data.each do |player|
        #  binding.pry
            arr << player[:number]
          end
        end
      end
    end
  end
arr
end

def player_stats(player_name)
hash = {}
game_hash.each do|place, team| 
    team.each do|attribute, data| 
      if attribute == :players
      data.each do |player|
          if player[:player_name] == player_name
            hash = player
          end
        end
      end
    end
  end
hash.delete(:player_name)
hash
end

def big_shoe_rebounds
arr = [0, 0]
  game_hash.each do|place, team| 
    team.each do|attribute, data| 
      if attribute == :players
      data.each do |player|
          if player[:shoe] > arr[0]
             arr = [player[:shoe], player[:rebounds]]
          end
        end
      end
    end
  end
  arr[1]
end

def most_points_scored
  arr = [0, '']
  game_hash.each do|place, team| 
    team.each do|attribute, data| 
      if attribute == :players
      data.each do |player|
          if player[:points] > arr[0]
             arr = [player[:points], player[:player_name]]
          end
        end
      end
    end
  end
  arr[1]
end

def winning_team
home_score = 0 
away_score = 0
game_hash.each do|place, team| 
    if team[:team_name] == 'Charlotte Hornets'
      team.each do|attribute, data| 
        if attribute == :players
        data.each do |player|
            away_score+= player[:points]
          end
        end
      end
    else 
      team.each do|attribute, data| 
        if attribute == :players
        data.each do |player|
            home_score += player[:points]
          end
        end
      end
    end
  end
if (home_score>away_score) 
  return 'Brooklyn Nets' 
else
  return 'Charlotte Hornets'
end
end


def player_with_longest_name
  arr = [0, '']
  game_hash.each do|place, team| 
    team.each do|attribute, data| 
      if attribute == :players
      data.each do |player|
          if player[:player_name].length > arr[0]
             arr = [player[:player_name].length, player[:player_name]]
          end
        end
      end
    end
  end
  arr[1]
end

def long_name_steals_a_ton?
   arr = [0, '']
  game_hash.each do|place, team| 
    team.each do|attribute, data| 
      if attribute == :players
      data.each do |player|
          if player[:steals] > arr[0]
             arr = [player[:steals], player[:player_name]]
          end
        end
      end
    end
  end
  if arr[1] == player_with_longest_name
    return true
  else
    return false
  end
end
