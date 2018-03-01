class Task
  constructor: (el) ->
    @el = el
    @$el = $(el)

    @question = $(".task__question", @$el)
    @answer_form = $(".new_task", @$el)

    @bindings()

  bindings: (el)->
    @answer_form.hide()
    setTimeout(@show_answer_form, 10000)

  show_answer_form: (event)=>
    @answer_form.show()
    @question.hide()


$ ->
  new Task(".test")
