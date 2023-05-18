
        class AuthorsController < ApplicationController
            def show
              @author = User.find(params[:id])
              @events = @author.created_events
            end
        end

