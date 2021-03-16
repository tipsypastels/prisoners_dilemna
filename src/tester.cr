class Tester < Strategy
  def choose(game : Game, foe : Strategy) : Choice
    return defect if game.turn == 1

    if foe.past_choices.any?(&.==(defect))
      foe.past_choices.last # become tit for tat
    else
      defect_ratio = past_choices.count(&.==(defect)) / past_choices.size
      defect_ratio >= 0.5 ? cooperate : defect
    end
  end
end
