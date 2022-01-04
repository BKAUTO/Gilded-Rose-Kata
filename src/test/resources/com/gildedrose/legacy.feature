Feature: Gilded Rose behaviour of the legacy code

// Example of a scenario
Scenario: Once the sell by date has passed, Quality degrades twice as fast
	Given an item named <item> with quality <startingQuality> and which has to be sold in <startingSellIn> days
	When <daysHasPassed> day has passed
	Then its quality is <qualityValue>

	 Examples:
		| item 									| startingQuality |startingSellIn | daysHasPassed  | qualityValue |
		| "+5 Dexterity Vest" 		| 20 						| 1 						| 5 										| 		11 |
		| "Elixir of the Mongoose" | 20 					| 1 						| 5 										| 		11 |
		
Scenario: The Quality of an item is never negative
	Given an item named <item> with quality <startingQuality> and which has to be sold in <startingSellIn> days
	When <daysHasPassed> day has passed
	Then the quality is not negative

	 Examples:
		| item 									| startingQuality |startingSellIn | daysHasPassed  | 
		| "+5 Dexterity Vest" 		| 1 						| 1 						| 55 										| 	
		| "Elixir of the Mongoose" | 1 					| 5 						| 55 										| 		
		

Scenario: Aged Brie increases in quality the older it gets
	Given an item named <item> with quality <startingQuality> and which has to be sold in <startingSellIn> days
	When <days> day has passed
	Then it has to be sold in <sellInDays> days
	And its quality is <qualityValue>

	 Examples:
		| item 		| startingQuality |startingSellIn | days | sellInDays | qualityValue |
		| "Aged Brie" | 9 						| 11 						| 2 		| 9 				| 		11 |
		| "Aged Brie" | 9 						| 11 						| 3 		| 8 				| 		12 |
		
		
Scenario: The Quality of an item is never more than 50
	Given an item named <item> with quality <startingQuality> and which has to be sold in <startingSellIn> days
	When <days> day has passed
	Then the quality is no more than 50

	 Examples:
		| item 		| startingQuality |startingSellIn | days | #sellInDays | #qualityValue |
		| "Aged Brie" | 48 						| 11 						| 5 		|# 9 				| #		11 |
		| "Aged Brie" | 48						| 11 						| 20 		| #8 				| #		12 |
		| "Backstage passes" | 40			| 11 						| 7 		| #8 				| #		12 |
		| "Backstage passes" | 48 		| 11 						| 18 		|# 8 				| #		12 |
		

Scenario: Sulfuras being a legendary item, never has to be sold or decreases in Quality
	Given an item named <item> with quality <startingQuality> and which has to be sold in <startingSellIn> days
	When <days> day has passed
	Then sulfuras sellin never changes
	And sulfuras quality never changes

	 Examples:
		| item 												 | startingQuality |startingSellIn | days | #sellInDays | #qualityValue |
		| "Sulfuras, Hand of Ragnaros" | 80 							| -1 						| 20 		|# 9 				| #		11 |
		| "Sulfuras, Hand of Ragnaros" | 80 							| 0 						| 20 		|# 9 				| #		11 |
		
		
Scenario: Backstage passes Increaseing
	Given an item named <item> with quality <startingQuality> and which has to be sold in <startingSellIn> days
	When <days> day has passed
	Then its quality is <qualityValue>

	 Examples:
		| item 																				 | startingQuality |startingSellIn | days | qualityValue | #qualityValue |
		| "Backstage passes to a TAFKAL80ETC concert" | 5 							| 11 						| 7 		| 19 				| #		11 |
		| "Backstage passes to a TAFKAL80ETC concert" | 5 							| 4 						| 7 		| 0 				| #		11 |
		
		

		
		
		
		
		
		
		

		
		
		
		
		
		