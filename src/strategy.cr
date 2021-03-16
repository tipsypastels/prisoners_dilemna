abstract class Strategy
  COLORS = {:magenta, :cyan}

  property points = 0
  getter past_choices = [] of Choice

  def initialize(@index : Int32)
  end

  def to_s(io)
    io << "Strategy #{@index} (#{self.class})".colorize(color)
  end

  def make_choice(game : Game, foe : Strategy)
    choose(game, foe).tap do |choice|
      @past_choices << choice
      puts "#{self} chose #{choice}!"
    end
  end

  def log_final_score
    puts "#{self} scored #{@points} points."
  end

  private abstract def choose(game : Game, foe : Strategy) : Choice

  private macro defect
    Choice::Defect
  end

  private macro cooperate
    Choice::Cooperate
  end

  private def color
    COLORS[@index - 1]
  end
end
