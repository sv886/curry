require 'csv'

class GrowthRatesController < ApplicationController
  def index
    @growth_rates = fetch_growth_rates
      # jwo Rails + csv vid @ 22 mins
  end

  def show
  end

  def fetch_growth_rates
    growth_rates = []
    CSV.foreach(Rails.root + "csv/Data1.csv", headers: true) do |row|
      growth_rate = GrowthRate.new
      growth_rate.symbol = row.to_h["symbol"]
      growth_rate.company_name = row.to_h["company_name"]
      growth_rate.years_dividend_growth = row.to_h["years_dividend_growth"].to_i
      growth_rate.status = row.to_h["status"]
      growth_rate.last_increase = row.to_h["last_increase"]
      growth_rate.one_yr_growth = row.to_h["one_yr_growth"].to_f
      growth_rate.three_yr_growth = row.to_h["three_yr_growth"].to_f
      growth_rate.five_yr_growth = row.to_h["five_yr_growth"].to_f
      growth_rate.ten_yr_growth = row.to_h["ten_yr_growth"].to_f
      #shovel csv info into array above
      growth_rates << growth_rate
    end
    # return array
    growth_rates
  end

end
