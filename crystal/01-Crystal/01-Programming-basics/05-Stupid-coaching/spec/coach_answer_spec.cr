require "spec"
require "../src/coach_answer"

describe "#coach_answer" do
  it "should return a String" do
    coach_answer("Hello Coach!").should be_a String
  end

  it "replies saying he does not care when you enter a statement" do
    coach_answer("I would love to eat some pizza!").should eq "I don't care, get dressed and go to work!"
  end

  it "replies saying it's a silly question when you enter a question" do
    coach_answer("Can I eat some pizza?").should eq "Silly question, get dressed and go to work!"
  end

  it "does not answer back (i.e. answers with an empty string) when you tell him you are going to work" do
    coach_answer("I am going to work right now!").should eq ""
  end
end

describe "#coach_answer_enhanced" do
  it "should return a String" do
    coach_answer_enhanced("Hello Coach!").should be_a String
  end

  context "when not shouting" do
    it "replies saying he does not care when you enter a statement" do
      coach_answer_enhanced("I would love to eat some pizza!").should eq "I don't care, get dressed and go to work!"
    end

    it "replies saying it's a silly question when you enter a question" do
      coach_answer_enhanced("Can I eat some pizza?").should eq "Silly question, get dressed and go to work!"
    end

    it "does not answer back (i.e. answers with an empty string) when you tell him you are going to work" do
      coach_answer_enhanced("I am going to work right now!").should eq ""
    end
  end

  context "when shouting" do
    it "prepends a motivation statement before saying he does not care when you enter a statement" do
      expect = "I can feel your motivation! I don't care, get dressed and go to work!"
      coach_answer_enhanced("I WOULD LOVE SOME PIZZA!").should eq expect
    end

    it "prepends a motivation statement before saying that it's a silly question when you enter a question" do
      expect = "I can feel your motivation! Silly question, get dressed and go to work!"
      coach_answer_enhanced("CAN I EAT SOME PIZZA?").should eq expect
    end

    it "does not answer back (i.e. answers with an empty string) when you tell him you are going to work" do
      coach_answer_enhanced("I AM GOING TO WORK RIGHT NOW!").should eq ""
    end
  end
end
