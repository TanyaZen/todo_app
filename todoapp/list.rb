class List
  attr_accessor :name, :task_list, :list_file

  def initialize(list_name)
    @task_list=[]
    @name=list_name
    if File.exist?('My To Do List.txt')
      @list_file=File.new('My To Do List.txt', 'r')
      @list_file.each_line {|line|
        if line.strip.empty?
          next
        end
        a=line.split(':')
        task_name=a[0]
        @task_list << Task.new(task_name.rstrip)
      }

    end
    puts "#{@name} has been created"
  end

  def add_task (task_str)
    @task_list.each {|x|
      if x.name==task_str
        puts "Task already in the list"
        return
      end
    }
    @task_list.push(Task.new(task_str))

  end


  def delete_task (task_str)
    @task_list.each {|x|
      if x.name==task_str
        @task_list.delete(x)
      end
    }
  end

  def update_task (old_task_str, new_task_str)
    @task_list.push (Task.new(new_task_str))
    @task_list.delete_if {|x| x.name==old_task_str}
  end

  def update_task_status (task_str, status)
    @task_list.each {|x|
      if x.name==task_str
        if status=='Completed'
          x.update_status_to_complete
        else x.update_status_to_incomplete
        end

      end
    }

  end

  def print_updated_list
    puts "Your To-do List: \n\n"
    @task_list.each {|x| puts "#{x.name}: #{x.status}"}
  end

  def save_updated_file
    final_file=File.new('My To Do List.txt', 'w')
    @task_list.each {|x| final_file.puts("#{x.name} : #{x.status}")}
    final_file.close
  end


  end