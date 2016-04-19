min = 75
a,b,c,d = 4.times.map{|s| STDIN.gets.chomp.split(",")}
a,b,c,d = [a,b,c,d].map{|a|a.each_slice(5).to_a.concat(a.each_slice(5).to_a.transpose.concat((0..4).map{|n|[a[n*6],a[4+n*4]]}.transpose))}
a.each{|a|b.each{|b|c.each{|c|next if min<(a+b+c).uniq.size;d.each{|d|min=(a+b+c+d).uniq.size if min>(a+b+c+d).uniq.size}}}}
p min
