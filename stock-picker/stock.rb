module Stock
  def Stock.stock_picker(prices)
    profit = 0
    for low_price_index in 0...prices.length
      for high_price_index in (low_price_index + 1)...prices.length
        if (prices[high_price_index] - prices[low_price_index]) > profit
          profit = prices[high_price_index] - prices[low_price_index]
          buy_day = low_price_index
          sell_day = high_price_index
        end
      end
    end
    [buy_day, sell_day]
  end
end