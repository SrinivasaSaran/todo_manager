class Todo < ActiveRecord::Base

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
  
end
