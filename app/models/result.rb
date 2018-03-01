class Result
  def style_results
    "#{slylized_tasks.where(truthy: true).count} / #{slylized_tasks.count}"
  end

  def divided_results
    "#{divided_tasks.where(truthy: true).count} / #{divided_tasks.count}"
  end

  private

  def slylized_tasks
    @tasks ||= Task.where(content_type: "style").where.not(user_answer: nil)
  end

  def divided_tasks
    @div ||= Task.where.not(user_answer: nil, content_type: "style")
  end
end
