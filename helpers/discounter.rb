require_relative '../helpers/app_helper.rb'

class Discounter

  include AppHelper

  def initialize()

    discounts_file = File.read(File.join(@@root, 'data/discounts.json'))
    @discounts = JSON.parse(discounts_file, {:symbolize_names => true})

  end

  ##
  # Apply the largest possible discount to the total.
  #
  # @param total [Integer] In cents.
  # @return [Integer] The amount to discount, which could be nothing.
  ##
  def get_discount(total)

    largest_discount = 0.00

    @discounts.each do |discount|
      threshold = Money.new(discount[:threshold] * 100).cents
      # TODO: Add "discount[:discount] > largest_discount" in case array out of order.
      if total > threshold
        largest_discount = discount[:discount]
      end
    end

    largest_discount

  end

  def get_threshold(discount_amount)
    @discounts.each do |discount|
      if discount[:discount] == discount_amount
        return discount[:threshold]
      end
    end
  end

end
