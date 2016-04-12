n=STDIN.gets.to_i;puts (1..(n-3)).inject(0){|s,i|s+i*(n-i-2)}*n*(1..(n-3)).inject(1,:*)
