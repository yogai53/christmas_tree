wishlist = [
    {:name => "mini puzzle", :size => "small", :clatters => "yes", :weight => "light"},
    {:name => "toy car", :size => "medium", :clatters => "a bit", :weight => "medium"},
    {:name => "card game", :size => "small", :clatters => "no", :weight => "light"}
]

presents = [
    {:size => "medium", :clatters => "a bit", :weight => "medium"},
    {:size => "small", :clatters => "yes", :weight => "light"}
]

def guess_gifts (wishlist, presents)
	guessed_gifts = [] #Initialization of guessed gifts to empty array

	#This search is a weightage based searchn The weightages are assigned based on the tags. ex., size, clatters, weight
	#The possible values for size, clatters and weight are defined here.
	size = {"small" => 0, "medium" => 1, "large" => 2} #size: small, medium, large
	clatters = {"no"=> 0, "a bit"=> 1, "yes"=> 2} #clatters: no, a bit, yes
	weight = {"light"=> 0, "medium"=> 1, "heavy"=> 2} #weight: light, medium, heavy

	#Empty dictionary is created. This is going to hold all the wishlists and the wishlists are going to be placed based on its weightage. 
	#length of dictionary = length of 'size' + length of 'clatters' + length of 'weight'
	#In the above case, the length of dictionary it 3 * 3 * 3 = 27
	dictionary = Array.new(size.length * clatters.length * weight.length) {[]} 

	#Placement of wishlists into the dictionary based on their weightage. weightage calculation explained below at the last
	wishlist.each do |w|
		weightage = size[w[:size]].to_i + clatters[w[:clatters]].to_i + weight[w[:weight]].to_i
		dictionary[weightage] << w
	end

	#Iteration of presents and search of each present from the dictionary based on the weightage
	presents.each do |p|
		weightage = size[p[:size]].to_i + clatters[p[:clatters]].to_i + weight[p[:weight]].to_i
		guessed_gifts += dictionary[weightage]
	end

	#Picking the name of the items and removing the duplicates.
	guessed_gifts = guessed_gifts.map {|g| g[:name]}.uniq
end

my_guessed_gifts = guess_gifts wishlist, presents

puts "Hey!!! I just found what is inside...Let me show you"
puts "===================================================="
puts my_guessed_gifts


# Weightage Calculation.
#==========================
# size = {"small" => 0, "medium" => 1, "large" => 2} #size: small, medium, large
# clatters = {"no"=> 0, "a bit"=> 1, "yes"=> 2} #clatters: no, a bit, yes
# weight = {"light"=> 0, "medium"=> 1, "heavy"=> 2} #weight: light, medium, heavy
#================================================================================
# If size = 'small', clatters = 'yes', weight = 'light'
# Weightage = 0 + 2 + 0 = 2




