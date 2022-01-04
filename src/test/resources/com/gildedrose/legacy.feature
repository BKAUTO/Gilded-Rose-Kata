Feature: Gilded Rose behaviour of the legacy code



// Example of a scenario
Scenario: Aged Brie increases in quality the older it gets
	Given an item named "Aged Brie" with quality 9 and which has to be sold in 11 days
	When 2 day has passed
	Then it has to be sold in 9 days
	And its quality is 11

	
