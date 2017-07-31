require './task'
require './list'


task_menu=["Add Task","Delete Task","Update Task","Mark Status as Complete","Mark Status as Incomplete", "See my To-do List","Exit"]
my_list=List.new('my list')


loop do
  puts "Please select from the menu:"
  task_menu.each_with_index {|x,idx| puts "#{idx+1}.#{x}"}

  selection=gets.chomp


  if selection=='1'
    puts "Please type in new task \n\n"
    my_list.add_task (gets.chomp)
    my_list.print_updated_list


  elsif selection=='2'
    puts "Please select the task to delete \n\n"
    my_list.delete_task (gets.chomp)
    my_list.print_updated_list

  elsif selection=='3'
    puts "What task should be replaced? \n\n"
    a=gets.chomp
    puts "Enter new name for the task \n\n"
    b=gets.chomp
    my_list.update_task(a.to_str,b.to_str)
    my_list.print_updated_list

  elsif selection=='4'
    puts 'What task should be marked completed?'
    my_list.update_task_status(gets.chomp, 'Completed')
    my_list.print_updated_list

  elsif selection=='5'
    puts 'What task should be marked incomplete?'
    my_list.update_task_status(gets.chomp, 'Incomplete')
    my_list.print_updated_list

  elsif selection=='6'
    my_list.print_updated_list

  elsif selection=='7'
    print 'Thank you for updating your list'
  elsif
    print "This command is not in menu \n\n"
  end

  break if selection=='7'

end

my_list.save_updated_file







