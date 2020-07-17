module StringMethods
  def StringMethods.substrings(words, dictionary)    
    dictionary.inject(Hash.new) do |hash, dict_word|
      word_count = words.downcase.scan(dict_word).count
      hash[dict_word] = word_count if word_count > 0        
      hash
    end   
  end
end