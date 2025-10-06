module TodoTasksHelper
    def priority_badge(priority)
        return '' if priority.blank?

        css = case priority
            when 'high' then 'badge badge-high'
            when 'medium' then 'badge badge-medium'
            else  'badge badge-low'
            end
        content_tag(:span, priority.titleize, class: css)
  end
 
  def due_status_class(task)
    return ' ' unless task.due_date
    return 'overdue' if !task.completed && task.due_date < Time.current
    return 'due-soon' if !task.completed && task.due_date <= 3.days.from_now
     ''
  end
end
