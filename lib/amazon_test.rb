def search_suggestions(repository, customer_query)
  results = []
  query_index = 1

  customer_query.length.times do
    returns = []

    repository.each do |string|
      s = string.downcase
      new_query = customer_query[0..query_index]
      returns << s if s.start_with?(new_query)
    end
    query_index += 1
    results << returns.sort[0..2]
  end
  results
end


p search_suggestions(["mobile", "mouse", "moneypot", "monitor", "mousepad"], "mouse")


def find_valid_discount_coupons(discounts)
  value = []

  discounts.each do |discount|
    answer = false
    until answer == true || discount.empty? do

      answer = discount.split('').all? do |char|
        char == 'a' || char == 'b'
      end
      discount = discount[1..-2]
    end
    if answer == true
      value << 1
    else
      value << 0
    end
  end
  value
end

p find_valid_discount_coupons(['abba', 'abca'])
p find_valid_discount_coupons(['daabbd', 'abc'])
