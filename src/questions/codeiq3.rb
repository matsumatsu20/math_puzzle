a = STDIN.gets.chomp.split(",")
b = STDIN.gets.chomp.split(",")
c = STDIN.gets.chomp.split(",")
d = STDIN.gets.chomp.split(",")

def get_bingo_pattern(array)
  yoko = array.each_slice(5).to_a
  n1 = [array[0], array[6], array[12], array[18], array[24]]
  n2 = [array[4], array[8], array[12], array[16], array[20]]
  yoko.concat(yoko.transpose) << n1 << n2
end

a_pattern = get_bingo_pattern(a)
b_pattern = get_bingo_pattern(b)
c_pattern = get_bingo_pattern(c)
d_pattern = get_bingo_pattern(d)

# 今回取りうる答えの最大は75のため、minに75をセットする。
# 0で初期化してしまうと、0のときの分岐が増える。
min = 75
a_pattern.each do |a|
  b_pattern.each do |b|
    # この時点でminより大きくなることはそうそうないので分岐を増やさないためコメントアウト
    # next if min < (a + b).uniq.size
    c_pattern.each do |c|
      # この時点でminより大きければ処理をskipする
      next if min < (a + b + c).uniq.size
      d_pattern.each do |d|
        sum = a + b + c + d
        min = sum.uniq.size if min > sum.uniq.size
      end
    end
  end
end

puts min
