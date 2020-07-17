module Sort
  def Sort.bubble_sort(array)
    n = array.length
    loop do
      swapped = false
      for i in 1..(n - 1) do
        if array[i - 1] > array[i]
          array[i - 1], array[i] = array[i], array[i - 1]
          swapped = true
        end
      end
      n -= 1
      break unless swapped
    end
    array
  end
end