class Home1Controller < ApplicationController
    def index
      @a = User.all
    end
    end
