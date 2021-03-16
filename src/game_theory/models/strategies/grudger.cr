class Grudger < Strategy
  @foe_did_ever_defect = false

  def choose(game : Game, foe : Strategy) : Choice
    return Choice::Defect if @foe_did_ever_defect

    case foe.past_choices.last?
    when Choice::Defect
      @foe_did_ever_defect = true
      Choice::Defect
    else
      Choice::Cooperate
    end
  end
end
