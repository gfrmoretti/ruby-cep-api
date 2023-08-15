module AuthenticationHelper
  def authenticate_user(user)
    allow(controller).to receive(:authorize_request) # Mock authorize_request
    allow(controller).to receive(:debounce_action)   # Mock debounce_action
    allow(controller).to receive(:current_user).and_return(user)
  end
end
