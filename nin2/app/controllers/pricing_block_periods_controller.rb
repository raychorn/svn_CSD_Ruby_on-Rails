class PricingBlockPeriodsController < ApplicationController
  include TimeBlockPeriod

  def index
    if current_user.has_role? :interpreter
      @plans = PricingBlockPeriod.my_plan(current_user.person.pricing_plan.id) 
      @timeblocks = get_calendar_blocks
    end     
    puts @timeblocks.to_json
    puts ' '
    puts @plans.to_json
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @plans.to_json }
      format.js  { render :json => @timeblocks }
    end
  end
  
  def show
    @pricing_block_period = PricingBlockPeriod.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pricing_block_period }
      format.js { render :json => @pricing_block_period.to_json }
    end
  end
  
  def new
    @pricing_block_period = PricingBlockPeriod.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pricing_block_period }
    end
  end
  
end  