package com.gildedrose;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class GildedRoseSteps {
	GildedRose gr;
	Item item;
	int sellInDays;
	
	@Given("an item named {string} with quality {int} and which has to be sold in {int} days")
	public void anItemNamedWithQualityAndWhichHasToBeSoldInDays(String name, Integer quality, Integer sellInDays) {
		guildedRoseWithItem(name,sellInDays,quality);
	}
	
	private void guildedRoseWithItem(String name, Integer sellIn, Integer quality) {
		item = new Item(name,sellIn,quality);
		gr = new GildedRose(new Item[] {item});
	}

	@When("{int} day has passed")
	public void DaysHavePassed(int days) {
		for (int i = 0; i < days; i++) {
			gr.updateQuality();
		}
	}
	
	@Then("it has to be sold in {int} days")
	public void itHasToBeSoldInDays(Integer sellInDays) {
	    assertEquals((int) sellInDays, item.sellIn);
	}
	
	@Then("its quality is {int}")
	public void itsQualityIs(Integer int1) {
	    assertEquals((int) int1, item.quality);
	}

	@Then("the quality is no more than 50")
	public void compareQuality50() {
	   assertTrue(item.quality <= 50);
	}

	@Then("the quality is not negative")
	public void negativeQuality() {
		assertTrue(item.quality >= 0);
	}

}
