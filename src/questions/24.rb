TARGET_NUM = (1..9).to_a
PAIRS = [[1, 2], [1, 4], [2, 3], [3, 6], [4, 7], [6, 9], [7, 8], [8, 9]]
@cnt = 0

def strike!(itimai, nimai)
  combination = itimai + nimai
  combination.each do |mato|
    if mato.is_a?(Array)
      a = itimai.reject{|itimai| itimai == mato.first || itimai == mato.last}
      b = nimai.reject{|nimai| nimai.include?(mato.first) || nimai.include?(mato.last)}
    else
      a = itimai.reject{|itimai| itimai == mato}
      b = nimai.reject{|nimai| nimai.include?(mato)}
    end
    return if (a + b).empty? and @cnt += 1
    strike!(a, b)
  end
end

strike!(TARGET_NUM, PAIRS)

p @cnt