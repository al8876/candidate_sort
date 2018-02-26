# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.each do |person|
    if person[:id] === id
      return person
    end
  end
  return nil
end

def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end

def git_points?(candidate)
  candidate[:github_points] >= 100
end

def ruby_or_python?(candidate)
  candidate[:languages].include? "Ruby" || "Python"
end

def time_requirement?(candidate)
  candidate[:date_applied] >= 15.days.ago.to_date
end

def age_requirment?(candidate)
  candidate[:age] > 17
end

def ordered_by_qualification(candidates)
  list = qualified_candidates(candidates)
  list.sort_by { |person| [person[:years_of_experience], person[:github_points]] }.reverse
end

def qualified_candidates(candidates)
  candidates.select do |person|
    experienced?(person) && git_points?(person) && ruby_or_python?(person) && time_requirement?(person) && age_requirment?(person)
  end
end