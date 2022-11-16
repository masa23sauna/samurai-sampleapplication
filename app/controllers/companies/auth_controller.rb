module Companies
  class AuthController < ApplicationController
    before_action :authenticate_account!
  end
end