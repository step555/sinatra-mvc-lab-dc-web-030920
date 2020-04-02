class PigLatinizer 
    attr_accessor :text

    # def initialize(text)
    #     @text = text
    # end

    def piglatinize(text)
        final_word = []
      
        @@split_text = text.split(" ").map{|text| text.split("")}
      
        vowel_arr = text.gsub(/[^aAeEiIoOuU]/, "").chars
        @@consonants_arr = []
        i = 0
        @@split_text.each do |letter_arr|
            letter_arr.each do |letter|
                if vowel_arr.include?(letter)
                    @@consonants_arr = letter_arr[0...i]
                    break
                end
                i += 1
            end
            letter_arr.shift(@@consonants_arr.count)
    
            if @@consonants_arr.empty?
                letter_arr << "w"
                letter_arr << "a"
                letter_arr << "y"
            elsif !@@consonants_arr.empty?
                x = 0
                while x < @@consonants_arr.count do
                letter_to_move = @@consonants_arr[x]
                letter_arr << letter_to_move
                x+=1
                end
                letter_arr << "a"
                letter_arr << "y"
            end
            
            final_word << letter_arr.join
            i = 0
            end
        final_word.join(" ")
      end
end

# class PigLatinizer

#     def piglatinize(input_str)
#       input_str.split(" ").length == 1 ? piglatinize_word(input_str) : piglatinize_sentence(input_str)
#     end
  
#     # private
  
#     def consonant?(char)
#       !char.match(/[aAeEiIoOuU]/)
#     end
  
#     def piglatinize_word(word)
#       # word starts with vowel
#       if !consonant?(word[0])
#         word = word + "w"
#       # word starts with 3 consonants
#       elsif consonant?(word[0]) && consonant?(word[1]) && consonant?(word[2])
#         word = word.slice(3..-1) + word.slice(0,3)
#       # word starts with 2 consonants
#       elsif consonant?(word[0]) && consonant?(word[1])
#         word = word.slice(2..-1) + word.slice(0,2)
#       # word starts with 1 consonant
#       else
#         word = word.slice(1..-1) + word.slice(0)
#       end
#       word << "ay"
#     end
  
#     def piglatinize_sentence(sentence)
#       sentence.split.collect { |word| piglatinize_word(word) }.join(" ")
#     end
  
  
  
  
#   end