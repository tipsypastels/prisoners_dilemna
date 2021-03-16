# `TitForTat`
# Cooperates the first turn, then copies the foe's last turn.
class TitForTat < Strategy
  def choose(game : Game, foe : Strategy) : Choice
    foe.past_choices.last? || first_turn_choice
  end

  private def first_turn_choice
    cooperate
  end
end
