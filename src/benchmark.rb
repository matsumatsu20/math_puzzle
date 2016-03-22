require 'benchmark'

# ラベル行の表示
puts Benchmark::CAPTION

max, min, sum = 0, 0, 0

# データ計測
10.times do |i|
  result = Benchmark.measure{
    load './questions/24.rb'
  }

  max = result.real > max ? result.real : max
  min = result.real < min || min == 0 ? result.real : min
  sum += result.real

  # 結果表示
  puts result
end

printf("MAX: %fms\n", max * 1000)
printf("MIN: %fms\n", min * 1000)
printf("AVG: %fms\n", (sum / 10) * 1000)
