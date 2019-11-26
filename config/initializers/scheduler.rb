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
  
  

scheduler.every '1m' do



puts "🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨 \n \n \n \n \n [GET LAST FEW PRICES, SEE IF LATEST WAS A BUY OR SELL, POINT INCREASES NEEDED FOR PROFIT] \n \n \n \n \n 🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨"

end
