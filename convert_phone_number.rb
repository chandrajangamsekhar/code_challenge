class ConvertPhoneNumber
  def is_invalid_phone_number?(phone_number)
    if phone_number.nil?
      puts "Phone Number can't be Blank..."
      return false
    elsif phone_number.split('').select{|a|(a.to_i < 2 )}.length > 0
      puts "Phone Number shouldn't contain 0 and/or 1"
      return false
    else
      return true
    end
  end

  def dictionary_source
    dictionary_hash = {}
    file_path = "dictionary.txt"
    File.foreach(file_path) do |row|
      if dictionary_hash[row.length]
        dictionary_hash[row.length] << row.chop.to_s.downcase
      else
        dictionary_hash[row.length] = [row.chop.to_s.downcase]
      end
    end
    dictionary_hash
  end

  def selected_key_char_mapping(phone_number)
    number_letter_map = {
      "2" => ["a", "b", "c"],
      "3" => ["d", "e", "f"],
      "4" => ["g", "h", "i"],
      "5" => ["j", "k", "l"],
      "6" => ["m", "n", "o"],
      "7" => ["p", "q", "r", "s"],
      "8" => ["t", "u", "v"],
      "9" => ["w", "x", "y", "z"]
    }
    phone_number.chars.collect{ |pkey| number_letter_map[pkey] }
  end

  def convert_numbers(phone_number)
    # Check Given Phone number as per requirement or not...
    unless is_invalid_phone_number?(phone_number)
      return []
    end
    
    #Gives All words of dictionary into hash
    dictionary_hash = dictionary_source

    #Get All chars of from input to process/build words
    selected_key_chars = selected_key_char_mapping(phone_number)

    results = {}
  end
end