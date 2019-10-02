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

  def run_quiz
    puts "How many questions?"
    amountOfQuestions = gets.to_i
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
      puts "Wrong!"
      end
      i += 1
    end
    puts "you got #{score} out of #{amountOfQuestions}"
  end
end
