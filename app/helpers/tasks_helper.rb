module TasksHelper

  def color(task)
    "success" if task.complete
  end

  def display(task)
  	true if task.complete
  end

  def complete()
  	sprintf( "%0.02f", (@complete.count.to_f/@tasks.count) * 100)
  end

  def uncomplete()
  	sprintf( "%0.02f", 100 - complete().to_f)
  	
  end

end
