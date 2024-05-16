require 'rails_helper'

RSpec.describe ErrorObject do
  describe 'initialization' do
    it 'creates an ErrorObject with message and code' do
      message = 'Something went wrong'
      code = 500
      error = ErrorObject.new(message, code)
      
      expect(error.message).to eq(message)
      expect(error.code).to eq(code)
    end
  end
end