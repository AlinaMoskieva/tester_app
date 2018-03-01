module Tests
  class Create
    include Interactor

    delegate :user, :test, to: :context

    NUMBERS = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"].freeze
    ICONS = { zero: "0", one: "1", two: "2", three: "3", four: "4", five: "5", six: "6", seven: "7", eight: "8", nine: "9" }.freeze
    DIVIDING_SYMBOLS = [" ", "<br>"].freeze

    def call
      context.test = Test.create(user: user)
      generate_tasks
    end

    private

    def generate_tasks
      create_positon_task
      # TODO: creaty_stylized_tasks
    end

    def create_positon_task
      DIVIDING_SYMBOLS.each do |symbol|
        create_verbal_task(symbol)
        create_task_with_icon(symbol)
      end
    end

    def create_verbal_task(div)
      answer, question = [generate_answer, ""]
      answer.split("").each { |num| question += NUMBERS[num.to_i] + div}

      Task.create(test: test, answer: answer, question: question, content_type: "verbal", index: task_index)
    end

    def create_task_with_icon(div)
      answer, question = [generate_answer, ""]
      answer.split("").each { |num| question +=  ICONS[NUMBERS[num.to_i].to_sym] + div}

      Task.create(test: test, answer: answer, question: question, content_type: "icon", index: task_index)
    end

    def generate_answer
      answer = ""
      random_number.times { answer += random_number.to_s }
      answer.split("").uniq.join
    end

    def task_index
      return 0 if test.tasks.last.nil?
      test.tasks.last.index + 1
    end

    def random_number
      rand(1..10)
    end
  end
end
