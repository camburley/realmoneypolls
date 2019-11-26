require 'rufus-scheduler'
require 'net/http'
require 'uri'
require 'json'
require 'rubygems'
require 'logger'
require 'active_record'
current_dir = Dir.pwd

# MODELS
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

# SCHEDULER
scheduler = Rufus::Scheduler.new
uri = URI.parse("https://www.predictit.org/api/marketdata/all/")

scheduler.every '1m' do
  call = Net::HTTP.get_response(uri)
  data = JSON.parse(call.body)
  
i = 0
markets = data['markets']
while i < markets.count do
  mId = markets[i]['id']
  mName = markets[i]['name']
  mShortName = markets[i]['shortName']
  mImage = markets[i]['image']
  mURL = markets[i]['url']
  mStatus = markets[i]['status']
  mCount = markets.count
  deals = markets[i]['contracts']
  mType = if deals.count > 1 then "linked" else "binary" end
  contractIDS = []
  if Market.find_by(:market_id => mId)
  else Market.create(:market_id => mId, :name => mName, :short_name => mShortName, :status => mStatus, :image => mImage, :url => mURL, :market_type => mType)
  end
  
  k = 0
  while k < deals.count do 
    contractData = deals[k]
    cID = deals[k]['id']
    contractIDS.push(cID)
    cLastTradePrice = deals[k]['lastTradePrice']
    cBestBuyYes = deals[k]['bestBuyYesCost']
    cBestBuyNo = deals[k]['bestBuyNoCost']
    cBestSellYes = deals[k]['bestSellYesCost']
    cBestSellNo = deals[k]['bestSellNoCost']
    cLastClose = deals[k]['lastClosePrice']
    cLongName = deals[k]['longName']
    cName = deals[k]['name']
    cImage = deals[k]['image']
    cDateEnd = deals[k]['dateEnd']
    cStatus = deals[k]['status']
    upsideDown = upValue = cLastTradePrice.to_f > cBestBuyYes.to_f
    up = true if cLastTradePrice.to_f > cLastClose.to_f
    upValue = true if cLastTradePrice.to_f - cLastClose.to_f
    down = true if cLastClose.to_f > cLastTradePrice.to_f
    downValue = cLastClose.to_f - cLastTradePrice.to_f
    wasSold = true if cLastTradePrice.to_f < cBestBuyYes.to_f
    wasBought = true if cLastTradePrice.to_f == cBestBuyYes.to_f
    cigarButts = cBestBuyYes.to_f < cBestSellYes.to_f
    makeProfitPrice = cBestBuyYes.to_f + 0.01
    

    if cBestBuyYes.to_f == cBestSellYes.to_f
      puts "\n \n \n \n \n 🚨🚨🚨 \n \n \n \n \n #{cName} -- is a Cigar Butt -- find it here #{mURL} ALSO #{cBestBuyYes} buy #{cBestSellYes} sell \n \n \n \n \n 🚨🚨🚨 \n \n \n \n \n "
    end


    #checkForContracts = Contract.find_by(:contract_id => cID)
    #addContracts = Contract.create(:status => cStatus, :contract_id => cID, :image => cImage, :name => cName, :long_name => cLongName, :date_end => cDateEnd, :market_id => mId, :totalValues => 0 )
    cPricesCountUP = Value.where(:contract_id => cID).count
    #addPrices = Value.create(:contract_id => cID, :last_trade_price => cLastTradePrice, :best_buy_yes_offer => cBestBuyYes, :best_buy_no_offer => cBestBuyNo, :best_sell_yes_price => cBestSellYes, :best_sell_no_price => cBestSellNo, :last_close_price => cLastClose)

    
    if Contract.find_by(:contract_id => cID)
     Value.create(:contract_id => cID, :last_trade_price => cLastTradePrice, :best_buy_yes_offer => cBestBuyYes, :best_buy_no_offer => cBestBuyNo, :best_sell_yes_price => cBestSellYes, :best_sell_no_price => cBestSellNo, :last_close_price => cLastClose)
     addIt = cPricesCountUP + 1
     contract = Contract.where(:contract_id => cID)
     contract.update_all(:totalValues => addIt)
    else Contract.create(:status => cStatus, :contract_id => cID, :image => cImage, :name => cName, :long_name => cLongName, :date_end => cDateEnd, :market_id => mId, :totalValues => 0 )
    end
    
  k += 1
  end
  #Markets Loop
  idsCount = contractIDS.length
  bet = Market.where(:market_id => mId)
  bet.update_all(:contract_count => idsCount)
  bet.update_all(:contract_id => contractIDS)
  
  idsCount = []
  i += 1
 end



end 

scheduler.every '1m' do



puts "🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨 \n \n \n \n \n [GET LAST FEW PRICES, SEE IF LATEST WAS A BUY OR SELL, POINT INCREASES NEEDED FOR PROFIT] \n \n \n \n \n 🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨"

end
