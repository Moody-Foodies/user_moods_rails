class ErrorObject
  attr_reader :message, :code
  
  def initialize(message, code)
    @message = message
    @code = code
  end
end