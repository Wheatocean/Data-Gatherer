@answers = []

def ask(question)
  puts question
  @answers << gets.chomp.gsub(",", ";")
end

def category(name, total_questions, &questions)
  puts "Do you want to answer questions about #{name}?"
  answer = gets.chomp.downcase
  if answer == "yes"
    questions.call 
    @answers << nil
  elsif answer == "no"
    total_questions.times do
      @answers << nil
    end
  else 
    puts "Please answer either 'yes' or 'no'"
    category(name, total_questions, &questions)
  end
end

category "questings and colours", 3 do
  ask "What is your quest?"
  ask "What is your vest?"
  ask "What is your favorite colour?"
end

File.open('data.csv', 'a') do |f|
  f.puts @answers.join(",")
end