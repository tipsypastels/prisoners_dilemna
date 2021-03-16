# `TitForTwoTats`
# Defects if the foe just defected twice in a row, otherwise cooperates.
class TitForTwoTats < Strategy
  def choose(game : Game, foe : Strategy) : Choice
    return defect if defected_twice?(foe)
    cooperate
  end

  private def defected_twice?(foe)
    foe.past_choices[-1]? == defect && foe.past_choices[-2]? == defect
  end
end
