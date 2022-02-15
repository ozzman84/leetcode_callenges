def contains_duplicate(nums)
  nums.uniq != nums
end

# Runtime: 56 ms, faster than 94.93% of Ruby online submissions for Contains Duplicate.
# Memory Usage: 213.7 MB, less than 55.78% of Ruby online submissions for Contains Duplicate.
p contains_duplicate([1,2,3,1]) #true
p contains_duplicate([1,2,3,4]) #false
p contains_duplicate([1,1,1,3,3,4,3,2,4,2])  #true

def missing_number(nums)
  i = (0..(nums.size)).to_a - nums
  i[0]
  # nums.size * (nums.size + 1) / 2 - nums.sum
end

# Runtime: 60 ms, faster than 81.56% of Ruby online submissions for Missing Number.
# Memory Usage: 212.2 MB, less than 16.31% of Ruby online submissions for Missing Number.
p missing_number([3,0,1]) #2
p missing_number([0,1]) #2
p missing_number([9,6,4,2,3,5,7,0,1]) #8
p missing_number([0]) #1

# Given an array nums of n integers where nums[i] is in the range [1, n],
# return an array of all the integers in the range [1, n] that do not appear in nums.

def find_disappeared_numbers(nums)
  (1..nums.size).to_a - nums
end

# Runtime: 104 ms, faster than 99.32% of Ruby online submissions for Find All Numbers Disappeared in an Array.
# Memory Usage: 217.7 MB, less than 54.05% of Ruby online submissions for Find All Numbers Disappeared in an Array.

# Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
# You must implement a solution with a linear runtime complexity and use only constant extra space.



def single_number(nums)
  # result = Hash.new(0)

  result = nums.each_with_object(Hash.new(0)) do |element, hash|
    hash[element] += 1
    # 2 * nums.uniq.sum - nums.sum
    # nums.reduce(:^)
  end
  result.key(1)
end
# Runtime: 64 ms, faster than 79.49% of Ruby online submissions for Single Number.
# Memory Usage: 212.8 MB, less than 13.85% of Ruby online submissions for Single Number.

p 'single_number'
p single_number([2,2,1]) #1
p single_number([4,1,2,1,2]) #4
p single_number([1]) #1


# You are climbing a staircase. It takes n steps to reach the top.
# Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

# def climb_stairs(n, size = 1, num = 0)
#   return num if size > n
#   return num if n == 0
#   result = [1, 2].repeated_permutation(size).count do |i|
#     i.sum == n
#   end
#   climb_stairs(n, size + 1, num + result)
# end
def climb_stairs(n)
  a = 0
  b = 1
  n.times do
    b += a
    a = b - a
    # c = a + b
    # a = b
    # b = c
  end
  b
end

p 'climb_stairs'
p climb_stairs(2) #2
p climb_stairs(3) #3
p climb_stairs(4) #5

# You are given an array prices where prices[i] is the price of a given stock on the ith day.
#
# You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
#
# Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.


# def max_profit(prices)
#
# end
#
# # Array of int/prices and position is day
# # max profit of day/index of purchase & future day/index to sell
#
# # assumptions
# # if
#
#
#
# p 'max_profit'
# p max_profit([7,1,5,3,6,4]) #5
# p max_profit([7,6,4,3,1]) #0
#Success
# Details
# Runtime: 157 ms, faster than 100.00% of Ruby online submissions for Maximum Area of a Piece of Cake After Horizontal and Vertical Cuts.
# Memory Usage: 218 MB, less than 100.00% of Ruby online submissions for Maximum Area of a Piece of Cake After Horizontal and Vertical Cuts.

def max_area(h, w, horizontal_cuts, vertical_cuts)
    hc = [0] + horizontal_cuts.sort() + [h]
    vc = [0] + vertical_cuts.sort() + [w]

    x = 0
    hc.each_cons(2) do |i, n|
      x = (n - i) unless x > (n - i)
    end

    y = 0
    vc.each_cons(2) do |i, n|
      y = (n - i) unless y > (n - i)
    end

    x * y % ((10 ** 9) + 7)
end

p max_area(5, 4, [1,2,4], [1,3]) #4
p max_area(5, 4, [3,1], [1]) #6
p max_area(5, 4, [3], [3]) #9


# def max_profit(prices)
#   profit = 0
#   min_price = prices[0]
#   prices[1..-1].each do |future_price|
#     min_price = future_price if future_price < min_price
#     income = furture_price - min_price
#     profit = income if income > profit
#   end
#   return profit
# end
#
# p max_profit([7,1,5,3,6,4]) #5
# p max_profit([7,6,4,3,1]) #0


# Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
#
# A subarray is a contiguous part of an array.
# find continuous subarray with one number which has at least the number
# def max_sub_array(nums)
#
# end
#
# p max_sub_array([-2,1,-3,4,-1,2,1,-5,4]) #6
# p max_sub_array([1]) #1
# p max_sub_array([5,4,-1,7,8]) #23



def length_of_last_word(s)
    w = ''
    x = nil
    s.reverse.each_char do |l|
      break if x == true
        if l == ' ' && x == nil
            next
        elsif l != ' '
            w = l + w
            x = false
        else l == ' '
            x = true
        end
    end
    w
end


p length_of_last_word("Hello World")
p length_of_last_word("   fly me   to   the moon  ")
p length_of_last_word("luffy is still joyboy")
