class Api::ContractController < ApplicationController
  



    def contract_list
        list = []
            contracts = Contract.where(market_id: params[:market_id]) 
            contracts.each do |contract|
            group = JSON.parse(contracts.to_json(only: [:name, :status, :contract_id, :image]))
            list << group
            
        end
        render json: list, :status => 200
       
          end


      end

   
    
    
    

   


