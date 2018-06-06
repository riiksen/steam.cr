class Steam::User
  @steam_id : Int?
  @

  def initialize()

  end

  def request_validation_email
    
  end

  def log_on(**details)
    raise "Already logged on, cannot log on again" if self.logged_on?

    @steam_id = nil
    @limitations = nil
    @wallet = nil
    @email_info = nil
    @licenses = nil

    @logging_off = nil

    
  end

  def logged_on?

  end

  def logout

  end
end