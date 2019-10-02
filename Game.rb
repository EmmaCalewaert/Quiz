load 'Question.rb'

questionsFile = File.open("Questions.txt")
lines = questionsFile.readlines
questions = []
i = 0
while i < lines.length
  questions.push(Question.new(lines[i...i+5], lines[i + 5].to_s.strip))
  i += 6
end

def run_quiz(questions)
  answer = ""
  score = 0
  for question in questions
    puts question.question.join()
    answer = gets.chomp().upcase
    if question.correctAnswer?(answer)
      puts "Correct!"
      score += 1
    elsif
      puts "Wrong!"
    end
  end
  puts "you got #{score} out of #{questions.length()}"
end

run_quiz(questions)