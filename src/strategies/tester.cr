# `Tester`
# Defects on the first turn. If it ever receives a defection, turns into
# `TitForTat`. If not, it will defect whenever doing so would not put
# its defection percentage over 50%.
class Tester < Strategy
  def choose(game : Game, foe : Strategy) : Choice
    return defect if game.turn == 1

    if foe.past_choices.any?(&.==(defect))
      foe.past_choices.last # become tit for tat
    else
      defect_ratio >= 0.5 ? cooperate : defect
    end
  end

  private def defect_ratio
    past_choices.count(&.==(defect)) / past_choices.size
  end
end
