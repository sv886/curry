require 'csv'

class DividendsController < ApplicationController
  def index
    @dividends = []

    CSV.foreach(Rails.root + "csv/DividendHistory.csv", headers: true) do |row|
      #shovel csv info into array above
      @dividends << row.to_h
    end

  end

  def show
  end
end
