module Tests
  class Create
    include Interactor

    delegate :user, :test, to: :context

    NUMBERS = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"].freeze
    ICONS = { zero: "\x30\xE2\x83\xA3", one: "\x31\xE2\x83\xA3", two: "\x32\xE2\x83\xA3", three: "\x33\xE2\x83\xA3",
              four: "\x34\xE2\x83\xA3", five: "\x35\xE2\x83\xA3", six: "\x36\xE2\x83\xA3", seven: "\x37\xE2\x83\xA3",
              eight: "\x38\xE2\x83\xA3", nine: "\x39\xE2\x83\xA3" }.freeze
    DIVIDING_SYMBOLS = [" ", "<br>"].freeze
    SIZEZ = [10, 18].freeze

    def call
      context.test = Test.create(user: user)
      generate_tasks
    end

    private

    def generate_tasks
      create_positon_task
      creaty_stylized_tasks
    end

    def creaty_stylized_tasks
      SIZEZ.each do |size|
        create_resizable_task(size)
      end
    end

    def create_positon_task
      DIVIDING_SYMBOLS.each do |symbol|
        create_verbal_task(symbol)
        create_task_with_icon(symbol)
      end
    end

    def create_resizable_task(size)
      answer, question = [generate_answer, ""]
      answer.split("").each { |num| question += NUMBERS[num.to_i] + " " }
      question = "<p style='font-size: #{size}pt'>#{question}</p>"

      Task.create(test: test, answer: answer, question: question, content_type: "verbal", index: task_index)
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
