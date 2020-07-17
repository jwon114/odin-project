require './string_methods'

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts StringMethods.substrings("below", dictionary)
puts StringMethods.substrings("Howdy partner, sit down! How's it going?", dictionary)