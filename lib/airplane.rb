class Airplane
  attr_accessor :type, :loading, :horsepower, :flying, :fuel
  def initialize(type, loading, horsepower, fuel)
      @type = type
      @loading = loading
      @horsepower = horsepower
      @started = false
      @flying = false
      @not_start_message = "Airplane not started, please start"
      @fuel = fuel
  end

  def start
    if fuel >= 10
      if @started
        "Airplane Already Started"
      else
        @started = true
        @fuel -= 10
        "Airplane Started"
      end
    else
      "Airplane cannot start without fuel"
    end
  end

  def takeoff
  if fuel >= 10
    if !@started
      @not_start_message
    else
      @flying = true
      @fuel -= 10
      "Airplane Launched"
    end
  else
    "Airplane cannot takeoff without fuel"
  end

end

  def land
    if !@started
      @not_start_message
    elsif @flying == false
      "Airplane is already on the ground."
    else
      @flying = false
      @fuel -= 10
      "Airplane landed."
    end
  end


end
