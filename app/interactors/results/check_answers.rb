module Results
  class CheckAnswers
    include Interactor

    delegate :test, to: :context
    delegate :tasks, to: :test

    def call
      check_answers
    end

    private

    def check_answers
      tasks.each do |task|
        truthy = task.user_answer.gsub(" ",  "").eql?(task.answer)
        task.update(truthy: truthy)
      end
    end
  end
end
