class Api::MarketController < ApplicationController
  
    
  

    def markets
        if params[:status]
        else
            markets = Market.where(:status => "Open")
        end
        render json: markets, :status => 200
    
    end

    def market_list
        list = []
        if Market.where(id: params[:market_id])
                markets = Market.where(market_id: params[:market_id]) 
                markets.each do |market|
                group = JSON.parse(markets.to_json(only: [:short_name, :url, :image, :market_id]))
                list << group

            
            
        end
        render json: list, :status => 200
    end 

end
end
  

