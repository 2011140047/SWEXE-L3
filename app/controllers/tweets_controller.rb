class TweetsController < ApplicationController
    def index
        @tweets = Tweet.all
        logger.debug @tweets.count
    end
    def new
        @tweet = Tweet.new
    end
    def show
        @tweet = Tweet.find(params[:id])
    end
    def create
        @tweet = Tweet.new(message: params[:tweet][:message], 
                           tdate: Time.current,
                           file: params[:tweet][:file].read)
        if @tweet.save
            flash[:notice] = '1レコード追加しました'
            redirect_to root_path
        else
            render new_tweet_path
        end
    end
    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to root_path
    end
    def edit
        @tweet = Tweet.find(params[:id])
    end
    def update
        @tweet = Tweet.find(params[:id])
        message = params[:tweet][:message]
        file = params[:tweet][:file].read
        if @tweet.update(message: message, file: file)
            flash[:notice] = "1レコード更新しました"
            redirect_to root_path
        else
            render edit_tweet_path
        end
    end
    def get_image
        image = Tweet.find(params[:id])
        send_data image.file, disposition: :inline, type: 'image/png'
    end
end
