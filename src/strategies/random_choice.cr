class RandomChoice < Strategy
  RANDOM = Random.new

  def choose(game : Game, foe : Strategy) : Choice
    RANDOM.next_bool ? cooperate : defect
  end
end
