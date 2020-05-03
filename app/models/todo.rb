class Todo < ActiveRecord::Base
  def to_neat_look
    is_complete = completed ? "[X]" : "[ ]"
    "#{id}. Due: #{due_date.to_s(:rfc822)} #{todo_text} #{is_complete}"
  end

  def self.overdue
    where("due_date < ?", Date.today)
  end

  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def self.completed
    where(completed: true)
  end

  def self.not_completed
    where(completed: false)
  end

  def completed?
    completed == true
  end

  def self.add_task(new_task)
    create!(todo_text: new_task[:todo_text], due_date: Date.today + new_task[:due_in_days], completed: false)
  end

  def self.mark_as_complete!(completed_id)
    todo = find(completed_id)
    todo.completed = true
    todo.save
    todo
  end
end
