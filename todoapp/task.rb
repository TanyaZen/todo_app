class Task

  attr_accessor :name, :status

  def initialize(name, status='Incomplete')
    @name=name
    @status=status
  end

  def update_status_to_complete()
    @status='Completed '
  end

  def update_status_to_incomplete()
    @status='Incomplete'
  end

end