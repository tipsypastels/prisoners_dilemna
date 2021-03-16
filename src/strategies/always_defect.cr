class AlwaysDefect < Strategy
  def choose(game : Game, foe : Strategy) : Choice
    Choice::Defect
  end
end
