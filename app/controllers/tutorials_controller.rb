class TutorialsController < ApplicationController
    def index
        @tutorials = Tutorial.all
        render json: @tutorials
    end
end
