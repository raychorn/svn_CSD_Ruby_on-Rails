class PricingBlockPeriodsController < ApplicationController
  def index
    @events = PricingBlockPeriod.scoped  
#   @events = @events.after(params['start']) if (params['start'])
#   @events = @events.before(params['end']) if (params['end'])

    if current_user.has_role? :interpreter
      @events = @events.my_plan(current_user.person.pricing_plan.id)
    end  

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
      format.js  { render :json => @events }
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