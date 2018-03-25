# Determins the given number is prime or not and return True/False against result. 
def is_prime?(number)
  (2..Math.sqrt(number)).each do |divisor|
    return false if number % divisor == 0
  end
  true
end

# Return an array of prime numbers less than the given number.
def get_primes(limit)
  primes = []
  (2...limit).each do |number|
    primes << number if is_prime?(number)
  end
  primes
end

# Return the array, having consective sums of given prime numbers array.
def sum_primes(prime)
  sum_prime = [0]
  (1..prime.length).each do |i|
    sum_prime <<  prime[i-1] + sum_prime[i-1]
  end
  sum_prime
end

# Return the largest consective sum that is a prime number. 
def largest_prime_sum(limit)
  prime = get_primes(limit)
  sum_prime = sum_primes(prime)
  max_length = -1
  largest_prime_number = -1
 
  (0...prime.length).each do |i|
    (0...i).each do |j|
      break if (sum_prime[i] - sum_prime[j] > limit)      
      consective_sum  = sum_prime[i] - sum_prime[j]
      if ((max_length < i-j+1) and is_prime?(consective_sum))
         max_length = i-j+1
         largest_prime_number = consective_sum
      end
 
    end
  end
  largest_prime_number
end

# Pass number here to get the largest consective sum prime number less than the given number.
puts largest_prime_sum(1000000)

