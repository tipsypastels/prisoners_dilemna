require "colorize"

enum Choice
  Cooperate
  Defect

  def to_s
    super.downcase.colorize(color)
  end

  private def color
    case self
    when Cooperate then :green
    when Defect    then :red
    end.not_nil!
  end

  def self.matrix(a : Choice, b : Choice)
    case {a, b}
    when {Cooperate, Cooperate}
      {3, 3}
    when {Cooperate, Defect}
      {0, 5}
    when {Defect, Cooperate}
      {5, 0}
    else
      {1, 1}
    end
  end
end
