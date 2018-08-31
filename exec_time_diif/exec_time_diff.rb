require 'byebug'

def my_min(arr)
  
  arr.each_with_index do |el1, idx|
    min = true
    arr.each_with_index do |el2, idx2|
      next if idx >= idx2
      min = false if el1 > el2
    end
    return el1 if !!min
  end
end

def my_better_min(arr)
  min = arr.first
  arr.each do |el|
    min = el unless min < el
  end
  min
end

def lcs(arr)
  subset_arr = []
  arr.each_with_index do |el,i|
    arr.each_with_index do |el2,j|
      next if i > j
      subset_arr << arr[i...j]
    end
  end
  subset_arr.map { |array| array.reduce(:+) }.max
end
  
def lcs_better(arr)
  return arr.max if arr.all? { |el| el <= 0 }
  current_sum = 0
  max = 0
  arr.each do |el|
    current_sum += el
    max = current_sum if current_sum > max
    if current_sum <= 0
      current_sum = 0
    end
  end
  max
end

def first_anagram?(string1, string2)
  string1.chars.permutation.include?(string2.chars)
end

def second_anagrams?(string1, string2)
  string2_arr = string2.chars
  
  string1.each_char do |chr| 
    index = string2_arr.index(chr)
    return false if index.nil?
    string2_arr.delete_at(index)
  end 
  string2_arr.empty?
end

def third_anagram?(string1, string2)
  string1.sort == string2.sort
end

def fourth_anagram?(string1, string2)
  hash = {}
  string1.each_char do |chr|
    hash[chr] = [string1.count(chr), string2.count(chr)]
  end
  hash.all? { |k,v| hash[k].first == hash[k].last }
end

def fourth_anagram?(string1, string2)
  return false if string1.length != string2.length
  hash = Hash.new(0)
  string1.each_char do |chr|
    hash[chr] += 1
  end
  string2.each_char do |chr|
    hash[chr] -= 1
  end
  hash.values.all? { |el| el == 0 }
end

def brut_sum?(arr, target)
  i = 0
  while i < arr.length - 1
    j = i+1 
    while j < arr.length
      return true if arr[i] + arr[j] == target
      j += 1
    end
    i += 1
  end
  false
end

def sort_sum?(arr,target)
  sorted = arr.sort
  # sorted.each do |el|
  until sorted.empty?
    return true if sorted.bsearch { |x| x == target - sorted.shift }  
  end
  false
end

def hash_sum?(arr, target)
  hash = Hash.new(false)
  arr.each do |x|
    hash[x] = true
    return true if !!hash[target - x]
  end
  false
end

def naive_solution(array, window_size)
  current_max_range = -1.0 / 0.0
  array.each_with_index do |el, index|
    start = index
    finish = array[index + window_size]
    break if finish.nil?
    slice = array[index..finish]
    current_range = slice.max - slice.min
    current_max_range = current_range if current_range > current_max_range
  end
  current_max_range
end
    
