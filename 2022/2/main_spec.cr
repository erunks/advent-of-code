require "spec"
require "./main"

describe "AdventOfCode::Day2" do
  describe "part_one" do
    context "given the example from the problem" do
      input = "A Y\nB X\nC Z"

      it "calculates a score given input rounds" do
        part_one(input).should eq(15)
      end
    end

    context "when there are all draws" do
      input = "A X\nB Y\nC Z"

      it "calculates a score given input rounds" do
        part_one(input).should eq(15)
      end
    end

    context "when there are all wins" do
      input = "A Y\nB Z\nC X"

      it "calculates a score given input rounds" do
        part_one(input).should eq(24)
      end
    end

    context "when there are all losses" do
      input = "A Z\nB X\nC Y"

      it "calculates a score given input rounds" do
        part_one(input).should eq(6)
      end
    end

    context "for all possibilities" do
      it "calculates a score for the given input round" do
        part_one("A X").should eq(4)
        part_one("A Y").should eq(8)
        part_one("A Z").should eq(3)

        part_one("B X").should eq(1)
        part_one("B Y").should eq(5)
        part_one("B Z").should eq(9)

        part_one("C X").should eq(7)
        part_one("C Y").should eq(2)
        part_one("C Z").should eq(6)
      end
    end
  end

  describe "meet_condition" do
    it do
      meet_condition(Move.new("A"), "Y").should eq("A")
    end

    it do
      meet_condition(Move.new("B"), "X").should eq("X")
    end

    it do
      meet_condition(Move.new("C"), "Z").should eq("X")
    end
  end

  describe "part_two" do
    context "given the example from the problem" do
      input = "A Y\nB X\nC Z"

      it "calculates a score given input rounds" do
        part_two(input).should eq(12)
      end
    end

    context "for all possibilities" do
      it "calculates a score for the given input round" do
        part_two("A X").should eq(3)
        part_two("B X").should eq(1) # given
        part_two("C X").should eq(2)

        part_two("A Y").should eq(4) # given
        part_two("B Y").should eq(5)
        part_two("C Y").should eq(6)

        part_two("A Z").should eq(8)
        part_two("B Z").should eq(9)
        part_two("C Z").should eq(7) # given
      end
    end
  end
end
