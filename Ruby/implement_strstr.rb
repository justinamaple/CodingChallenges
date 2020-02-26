# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  return 0 if needle.empty?

  (0..haystack.length - needle.length).each do |i|
    match = true

    (0...needle.length).each do |j|
      if needle[j] != haystack[i + j]
        match = false
        break
      end
    end

    return i if match
  end

  -1
end
