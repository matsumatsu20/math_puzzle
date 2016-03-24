arr = [[false, false, false, false], [false, false, false, false], [false, false, false, false], [false, false, false, false]]

@stored_arr = []
@cnt = 0
@now = 0

PATTERN = 65536

def select(x, y, arr, n)
  return if @cnt > PATTERN

  hoge = arr.map.with_index{|r, i|
    i == x ? r.map{|c| !c } : r.map.with_index{|c, i2| i2 == y ? !c : c}
  }

  unless @stored_arr.include?(hoge)
    @stored_arr << hoge
    @cnt += 1
    p @cnt
  end

  n.times do |now|
    4.times do |x2|
      4.times do |y2|
        select(x2, y2, hoge, now)
      end
    end
  end
end

16.times do |n|
  @now += 1
  4.times do |x|
    4.times do |y|
      select(x, y, arr, n)
    end
  end
end

p @cnt
p @now
