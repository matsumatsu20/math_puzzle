#$answer = []
$stored_ratio = []

class Question16
  def main
    (4..500).step(4) do |i|
      calculate(i)
    end
  end

  def calculate(i)
    n = 1
    square_list = []
    square_area = i / 4 * i / 4

    while n < i / 4
      square_list << n * (i / 2 - n) if square?(n * (i / 2 - n))
      n += 1
    end

    unless square_list.empty?
      square_list.each do |pp|
        square_list.delete(pp)
        square_list.reverse.each do |ff|
          if square_area == pp + ff
            ratio = if ff > pp
              Math.sqrt(ff).to_f / Math.sqrt(pp).to_f
            else
              Math.sqrt(pp).to_f / Math.sqrt(ff).to_f
            end

            unless $stored_ratio.include?(ratio)
              #$answer << square_area.to_s + ' =  + ' + pp.to_s + '+' + ff.to_s
              $stored_ratio << ratio
            end
          end
        end
      end
    end
  end

  def square?(i)
    Math.sqrt(i) % 1 == 0.0
  end
end

q16 = Question16.new
q16.main

#$answer.each{|ans| p ans}
p $stored_ratio.size

#$stored_ratio.each{|ratio| p ratio.to_s}