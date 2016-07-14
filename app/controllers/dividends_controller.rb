require 'csv'

class DividendsController < ApplicationController
  def index
    @dividends = fetch_dividends
  end

  def show
  end

  def fetch_dividends
    dividends = []
    CSV.foreach(Rails.root + "csv/DividendHistory.csv", headers: true) do |row|
      dividend = Dividend.new
      dividend.symbol = row.to_h["symbol"]
      dividend.date = row.to_h["date"]
      dividend.payment = row.to_h["payment"].to_f
      #shovel csv info into array above
      dividends << dividend
    end
    # return array
    dividends
  end

end
