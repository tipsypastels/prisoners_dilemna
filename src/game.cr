require "./strategy"

class Game
  include Enumerable(Strategy)

  TURNS = 100

  @strat1 : Strategy
  @strat2 : Strategy

  getter turn = 1

  def initialize(strat1, strat2)
    @strat1 = strat1.new(1)
    @strat2 = strat2.new(2)
  end

  def each
    yield @strat1
    yield @strat2
  end

  def start
    until done?
      log "Turn #{@turn}"

      choice1 = @strat1.make_choice(self, @strat2)
      choice2 = @strat2.make_choice(self, @strat1)

      points1, points2 = Choice.matrix(choice1, choice2)

      @strat1.points += points1
      @strat2.points += points2

      @turn += 1
    end

    log "Game over"

    each(&.log_final_score)
  end

  private def done?
    @turn > TURNS
  end

  def completion
    @turn / TURNS
  end

  private def log(text)
    puts "\n--------- #{text.upcase} ----------\n\n"
  end
end
