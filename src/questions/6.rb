$total = 0

class Question3
  def main
    (2..10000).step(2) do |i|
      keisan(i * 3 + 1, i)
    end
  end

  def keisan(n, orig_n)
    n = if n % 2 == 0
      n / 2
    else
      n * 3 + 1
    end

    return true if n == orig_n and $total += 1
    return if n == 1

    keisan(n, orig_n)
  end
end

question = Question3.new
question.main
p $total
