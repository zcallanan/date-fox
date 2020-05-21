class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_experience, only: %i[show]

  def index
    # @search = params[:search_id]
    @search = Search.last

    @experiences = Experience.all

    @city = @search.city
    @price_range = @search.price_range
    @starts_at = @search.starts_at
    @ends_at = @search.ends_at
    @activity_array = @search.activity_ids

    # need to create 3 experiences for the user at this point
    # n = 0
    # 3.times do
    #   n += 1
    #   Experience.create(
    #     starts_at: @starts_at,
    #     ends_at: @ends_at,
    #     name: "Experience #{n}"
    #   )
    # end

    @items = YelpApiService.new(
      location: @city,
      radius: 10_000,
      category: 'restaurants'
    ).call

    { 'Breakfast' => ['cafes', 'cafeteria', 'caribbean'] }





    # Filter item by city
    # Filter by duration
    ## Filter item by starts at
    ## Filter item by ends at
    ## Are they open?
    # Matches an activity

    ## Does the activity fit their duration?

    # Filter item by


    # sum = 0
    # @activity_array.each do |activity|
    #   sum += activity.duration
    # end
    # average_duration = sum / @activity_kinds.size


    # @items = Item.where("price_range = ?", "#{@price_range.size}").order(rating: :desc)
    # model would be...
    # scope :search_by_price_range, lambda { |price|
    #   where("price_range = ?", "#{price}")
    # }
    # controller/service
    # @items = @items.search_by_price_range(@price_range.size)




    # what activities you have selected 1 activity = 1 item per experience
    # Calculate duration from search starts and ends datetime
    # With total duration, compare against duration of experience + travel time default to generate number of items
    # filter by price first, then duration, then rating
    ## top average duration
    ## if it exceeds desired duration, remove 1 or go with lowest duration items
    # @message activity you are looking for exceeds your duration
    # select items with the best rating
    # add items to an array
    # If user wants a different item
    # @item = Item.find(params[:id])

    # form is sending params
    # filter items by price_range params
    # sort items by rating params
    # group items by activity type
    # randomly select one item per activity type and store in one of three arrays
    ## what activities selected, for each activity get top ranked items and store them in arrays
  end

  def show
    @experience = Experience.find(params[:id])

  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def set_experience
    @experience = Experience.find(params[:id])
  end
end
