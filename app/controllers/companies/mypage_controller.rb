module Companies
  class MypageController < ApplicationController
    before_action :authenticate_account!
      def index
      end
  end
end