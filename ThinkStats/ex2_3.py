import Pmf
hist = Pmf.MakeHistFromList([1,2,2,3,3,3,5])

item_dict = []

for val, freq in hist.Items():
	item_list ={val: freq}
	item_dict.append(item_list)

final = {}
for x in item_dict: 
	final.update(x)

print final

#max using .get
print max(final, key = final.get)

#max using for loop to find max key and corresponding value
inverse = [(value, key) for key, value in final.items()]
print max(inverse)[1]