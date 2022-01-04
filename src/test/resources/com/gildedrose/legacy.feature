Feature: Gilded Rose behaviour of the legacy code

// Example of a scenario
Scenario: Once the sell by date has passed, Quality degrades twice as fast
	Given an item named <item> with quality <startingQuality> and which has to be sold in <startingSellIn> days
	When <daysHasPassed> day has passed
	Then it has to be sold in <resultingSellInDays> days
	And its quality is <qualityValue>

	 Examples:
		| item 									| startingQuality |startingSellIn | daysHasPassed | sellInDays | qualityValue |
		| +5 Dexterity Vest 		| 20 						| 1 						| 1 							| 9 				| 		11 |
		| Elixir of the Mongoose | 9 						| 11 						| 3 							| 8 				| 		12 |
		


Scenario: Aged Brie increases in quality the older it gets
	Given an item named <item> with quality <startingQuality> and which has to be sold in <startingSellIn> days
	When <days> day has passed
	Then it has to be sold in <sellInDays> days
	And its quality is <qualityValue>

	 Examples:
		| item 		| startingQuality |startingSellIn | days | sellInDays | qualityValue |
		| Aged Brie | 9 						| 11 						| 2 		| 9 				| 		11 |
		| Aged Brie | 9 						| 11 						| 3 		| 8 				| 		12 |
		
		
Scenario: The Quality of an item is never more than 50
	Given an item named <item> with quality <startingQuality> and which has to be sold in <startingSellIn> days
	When <days> day has passed
	Then The quality of the item is not greater than 50

	 Examples:
		| item 		| startingQuality |startingSellIn | days | sellInDays | #qualityValue |
		| Aged Brie | 48 						| 11 						| 5 		| 9 				| #		11 |
		| Aged Brie | 48						| 11 						| 20 		| 8 				| #		12 |
		| Backstage passes | 40			| 11 						| 7 		| 8 				| #		12 |
		| Backstage passes | 48 		| 11 						| 18 		| 8 				| #		12 |
		
