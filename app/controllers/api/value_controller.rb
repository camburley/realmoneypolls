class Api::ValueController < ApplicationController


   

def value_list
    list = []
        if Value.where(contract_id: params[:contract_id]).last(10) 
        values = Value.where(contract_id: params[:contract_id]).last(1)
        values.each do |value|
        group = JSON.parse(values.to_json(only: [:last_trade_price, :last_close_price, :best_buy_yes_offer, :best_buy_no_offer, :best_sell_yes_price, :best_sell_no_price]))
        list << group
        
    end

        render json:  list, :status => 200


      end


  end


end
