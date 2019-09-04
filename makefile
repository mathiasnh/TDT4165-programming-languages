
a1=Assignment1

run1: 
	ozc -c $(a1)/$(file).oz && ozengine $(file).ozf && rm $(file).ozf