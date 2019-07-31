def reverse(arr)
  i = 0
  j = arr.length - 1

  while i < j do
    last = arr[j]
    first = arr[i]

    arr[i] = last
    arr[j] = first

    i += 1
    j -= 1
  end

  puts arr
end

puts reverse([1,2,3])
