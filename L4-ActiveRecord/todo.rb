require "active_record"

class Todo < ActiveRecord::Base
  def due_today?
    due_date == Date.today
  end

  def self.due_today
    all.where("due_date =?", Date.today)
  end

  def self.due_Overdue
    all.where("due_date < ?", Date.today)
  end

  def self.due_Later
    all.where("due_date > ?", Date.today)
  end

  def to_displayable_string
    display_status = completed ? "[X]" : "[ ]"
    display_date = due_today? ? nil : due_date
    "#{id} #{display_status} #{todo_text}   #{display_date}"
  end

  def self.to_displayable_list
    all.map { |todo| todo.to_displayable_string }
  end

  def self.show_list
    puts "My Todo-list\n"
    puts "\n\n"

    puts "Overdue\n"
    puts due_Overdue.to_displayable_list
    puts "\n\n"

    puts "Due Today\n"
    puts due_today.to_displayable_list
    puts "\n\n"

    puts "Due Later\n"
    puts due_Later.to_displayable_list
    puts "\n\n"
  end

  def self.add_task(h)
    Todo.create!(todo_text: h[:todo_text], due_date: Date.today + h[:due_in_days], completed: false)
  end

  def self.mark_as_complete!(todo_id)
    begin
    rescue
      todo = find(todo_id)
      todo.completed = true
      todo.save
      todo
    else
      "Invalid Id"
    end
  end
end
