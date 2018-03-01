class Task
  constructor: (el) ->
    @el = el
    @$el = $(el)

    @question = $(".task__question", @$el)
    @answer_form = $(".new_task", @$el)
    @timer = $("#task__timer", @$el)

    @bindings()

  bindings: (el)->
    @answer_form.hide()
    setInterval(@incrementTimer, 1000)
    setTimeout(@show_answer_form, 5000)

  show_answer_form: (event)=>
    @answer_form.show()
    @timer.hide()
    @question.hide()

  incrementTimer: (event)=>
    element =  parseInt(@timer.text()) + 1
    @timer.text(element)


$ ->
  new Task(".test")
