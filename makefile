
run1: 
	ozc -c Assignment1/$(file).oz && ozengine $(file).ozf && rm $(file).ozf

run2: 
	ozc -c Assignment2/$(file).oz && ozengine $(file).ozf && rm $(file).ozf

run3: 
	ozc -c Assignment3/$(file).oz && ozengine $(file).ozf && rm $(file).ozf

run4: 
	ozc -c Assignment4/$(file).oz && ozengine $(file).ozf && rm $(file).ozf

run6: 
	ozc -c Assignment6/$(file).oz && ozengine $(file).ozf && rm $(file).ozf

rand: 
	ozc -c Test/$(file).oz && ozengine $(file).ozf && rm $(file).ozf
