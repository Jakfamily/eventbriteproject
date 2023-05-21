module Admin
class Admin::DashboardController < ApplicationController
    def index
      @total_users = User.count
      @total_events = Event.count
    end
  end
end
  