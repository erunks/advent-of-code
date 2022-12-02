enum MoveType : Int32
  Rock     = 1
  Paper    = 2
  Scissors = 3
end

enum Outcome : Int32
  Loss = 0
  Draw = 3
  Win  = 6
end

struct Move
  getter type : MoveType
  getter letter : String

  def initialize(@letter)
    @type = MoveType::Rock

    case @letter
    when "A", "X"
      @type = MoveType::Rock
    when "B", "Y"
      @type = MoveType::Paper
    when "C", "Z"
      @type = MoveType::Scissors
    end
  end
end

struct Round
  def initialize(@moves : Array(Move))
    @opponent = moves.first
    @you = moves.last
  end

  def score
    score = @you.type.value

    case {@opponent.type, @you.type}
    when {MoveType::Rock, MoveType::Paper}, {MoveType::Paper, MoveType::Scissors}, {MoveType::Scissors, MoveType::Rock}
      score += Outcome::Win.value
    when {MoveType::Paper, MoveType::Rock}, {MoveType::Scissors, MoveType::Paper}, {MoveType::Rock, MoveType::Scissors}
      score += Outcome::Loss.value
    else
      score += Outcome::Draw.value
    end

    score
  end
end

def parse_input(input) : Array(Array(String))
  input
    .split("\n")
    .reject { |i| i == "" }
    .map { |r| r.split(" ") }
end

def part_one(input)
  parse_input(input)
    .map { |r|
      moves = r.map { |m| Move.new(m) }
      Round.new(moves).score
    }
    .sum
end

def meet_condition(opponent : Move, condition : String) : String
  case condition
  when "X" # lose
    case opponent.type
    when MoveType::Rock
      return "Z"
    when MoveType::Paper
      return "X"
    when MoveType::Scissors
      return "Y"
    end
  when "Z" # win
    case opponent.type
    when MoveType::Rock
      return "Y"
    when MoveType::Paper
      return "Z"
    when MoveType::Scissors
      return "X"
    end
  end

  opponent.letter
end

def part_two(input)
  parse_input(input)
    .map { |r|
      opponent, condition = r
      opponent = Move.new(opponent)
      you = meet_condition(opponent, condition)
      moves = [opponent, Move.new(you)]
      Round.new(moves).score
    }
    .sum
end

input = File.read("./input.txt")
p part_one(input)
p part_two(input)
