module MainHelper
    def calculate_best(event,place)
        teams = Hash.new
        event.best.split("\n").each do |team|
            teams[team.split(" - ")[0]] = 0
        end
        event.best.split("\n").each do |team|
           s = team.split(" - ")[1].to_i*10
            teams[team.split(" - ")[0]] += s
        end
         event.outstanding.split("\n").each do |team|
            s = team.split(" - ")[1].to_i*5
            teams[team.split(" - ")[0]]+=s
        end
         event.honorable.split("\n").each do |team|
            s = team.split(" - ")[1].to_i*2
            teams[team.split(" - ")[0]]+=s
        end
        teams=teams.sort_by{ |name, score| score }
        teams=teams.reverse
        return teams.first(3)[place][0]
    end
end
