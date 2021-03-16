require "./tit_for_tat"

class SuspiciousTitForTat < TitForTat
  private def first_turn_choice
    defect
  end
end
