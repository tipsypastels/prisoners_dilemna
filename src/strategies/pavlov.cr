# `Pavlov`
# Cooperates if it made the same choice as the foe last turn.
class Pavlov < Strategy
  def choose(game : Game, foe : Strategy) : Choice
    return cooperate if made_same_choice?(foe)
    defect
  end

  private def made_same_choice?(foe)
    return false if past_choices.empty?
    foe.past_choices.last == past_choices.last
  end
end
