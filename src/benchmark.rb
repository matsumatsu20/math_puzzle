require 'benchmark'

# ラベル行の表示
puts Benchmark::CAPTION

max, min, sum = 0, 0, 0

# データ計測
11.times do |i|
  result = Benchmark.measure{
    require './questions/3.rb'
  }
  next if i == 0

  max = result.real > max ? result.real : max
  min = result.real < min || min == 0 ? result.real : min
  sum += result.real

  # 結果表示
  puts result
end

p 'MAX: ' + max.to_s
p 'MIN: ' + min.to_s
p 'AVG: ' + (sum / 10).to_s