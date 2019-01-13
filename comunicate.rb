require_relative 'lib/test'
require_relative 'lib/result_printer'

puts "Ваш уровень общительности.\nТест поможет определить ваш уровень общительности.Версия 1.0."
sleep 1

questions_path = "#{__dir__}/data/questions.txt"
results_path = "#{__dir__}/data/results.txt"

begin
  test = Test.new(questions_path)
rescue SystemCallError
  puts "Файл с вопросами не найден! #{questions_path}"
  exit
end

result_printer = ResultPrinter.new(results_path)

test.take_question until test.finished?

result_printer.print_result(test)