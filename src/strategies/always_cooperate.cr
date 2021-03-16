class AlwaysCooperate < Strategy
  def choose(game : Game, foe : Strategy) : Choice
    Choice::Cooperate
  end
end
