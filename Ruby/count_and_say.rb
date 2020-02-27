# @param {Integer} n
# @return {String}
def count_and_say(n)
  tabs = Array.new(30)
  tabs[1] = '1' # base case

  (2..n).each do |i|
    tabs[i] = build_cs(tabs[i - 1])
  end

  tabs[n]
end

def build_cs(str)
  new_str = ''
  count = 1

  (0..str.length).each do |i|
    if str[i] == str[i + 1]
      count += 1
    else
      new_str << count.to_s
      new_str << str[i]

      count = 1
    end
  end

  new_str
end
