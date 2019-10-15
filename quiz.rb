load 'Question.rb'

class Quiz
  attr_accessor :questions

  def initialize(questionFile, numberOfAnswers)
    @questions = setUpQuestions(questionFile, numberOfAnswers)
  end

  def setUpQuestions(questionFile, numberOfAnswers)
    questionsFile = File.open(questionFile)
    lines = questionsFile.readlines
    questions = []
    i = 0
    while i < lines.length
      questions.push(Question.new(lines[i...i + numberOfAnswers + 1], lines[i + numberOfAnswers + 1].to_s.strip))
      i += numberOfAnswers + 2
    end
    questions.shuffle!
  end

  def setAmountOfQuestions
    puts "How many questions?"
    amountOfQuestions = gets.to_i
    if(amountOfQuestions > questions.length)
      puts "Too many questions; not that many in list. Please enter a smaller number. (Max: " + questions.length.to_s + ")"
      setAmountOfQuestions
    end
    return amountOfQuestions
  end

  def playAgain
    puts "Play again? Y/N"
    reply = gets.chomp.upcase
    if reply == 'Y'
      questions.shuffle!
      return true
    elsif reply == 'N'
      return false
    else
      puts "Invalid input, try again."
      playAgain
    end
  end

  def run_quiz
    amountOfQuestions = setAmountOfQuestions
    score = 0
    i = 0
    while i < amountOfQuestions
      question = questions[i]
      puts question.question.join()
      answer = gets.chomp().upcase
      if question.correctAnswer?(answer)
        puts "Correct!"
        score += 1
      elsif
      puts "Wrong! The answer was " + question.answer + "."
      end
      i += 1
    end
    puts "you got #{score} out of #{amountOfQuestions}"
    if(playAgain)
      run_quiz
    end
  end
end
