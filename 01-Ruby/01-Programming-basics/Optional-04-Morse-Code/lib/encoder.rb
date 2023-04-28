def encode(text)
  # TODO: write a method which returns the morse sentence for the given text
  # NOTE: you may want to extract a `encode_word` method
  morse_alphabet = {
    "a" => ".-", "b" => "-...", "c" => "-.-.", "d" => "-..", "e" => ".", "f" => "..-.",
    "g" => "--.", "h" => "....", "i" => "..", "j" => ".---", "k" => "-.-", "l" => ".-..",
    "m" => "--", "n" => "-.", "o" => "---", "p" => ".--.", "q" => "--.-", "r" => ".-.",
    "s" => "...", "t" => "-", "u" => "..-", "v" => "...-", "w" => ".--", "x" => "-..-",
    "y" => "-.--", "z" => "--.."
  }

  text = text.downcase.gsub(/[^a-z ]/, '')
  morse_code = ""

  text.split(" ").each_with_index do |word, i|
    word.chars.each do |char|
      morse_code << morse_alphabet[char] + " " if morse_alphabet[char]
    end
    morse_code.strip!  # Remove trailing space
    morse_code << "|" unless i == text.split(" ").size - 1
  end

  morse_code
end
