# `AlwaysCooperate`
# Cooperates no matter what.
class AlwaysCooperate < Strategy
  def choose(game : Game, foe : Strategy) : Choice
    cooperate
  end
end
