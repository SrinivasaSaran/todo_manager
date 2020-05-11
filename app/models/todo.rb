class Todo < ApplicationRecord
  belongs_to :user
  validates :todo_text, length: { minimum: 2 }
  validates :due_date, presence: true

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
