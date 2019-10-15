class Question
  attr_accessor :question, :answer
  def initialize(question, answer)
    @question = question
    @answer = answer
  end

  def correctAnswer?(answer)
    @answer==answer
  end

  def askQuestion
    puts question.join()
  end
end