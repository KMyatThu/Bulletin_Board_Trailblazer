class UserDecorator < Draper::Decorator
    def full_name
      "#{object.name}"
    end
  
    def time_decorate(time)
        time.strftime("%A, %d %b %Y %l:%M %p")
    end
  end