require "./tit_for_tat"

# `SuspiciousTitForTat`
# Defects the first turn, then copies the foe's last turn
class SuspiciousTitForTat < TitForTat
  private def first_turn_choice
    defect
  end
end
