Rails.application.routes.draw do
 
    namespace :api do
 get 'market/markets' => 'market#markets'
 get 'market/market_list/:market_id' => 'market#market_list'
 get 'contract/contract_list/:market_id' => 'contract#contract_list'
 get 'value/value_list/:contract_id' => 'value#value_list'
    end

end
