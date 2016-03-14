require 'benchmark'

# ラベル行の表示
puts Benchmark::CAPTION

max, min, sum = 0, 0, 0

# データ計測
11.times do |i|
  result = Benchmark.measure{
    require './questions/6.rb'
  }
  next if i == 0

  max = result.real > max ? result.real : max
  min = result.real < min || min == 0 ? result.real : min
  sum += result.real

  # 結果表示
  puts result
end

printf("MAX: %fs\n", max)
printf("MIN: %fs\n", min)
printf("AVG: %fs\n", (sum / 10))
