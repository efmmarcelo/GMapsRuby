Given(/^the user accesses google maps$/) do
  browser.navigate_gmaps!
end

When(/^search for location "([^"]*)"$/) do |location|
  location_visible, headline_attribute = browser.search_location(location)

  assert location_visible, "Cannot validate that Left panel has #{location} element text visible!"
  assert_match "headline", headline_attribute, "Cannot validate that Left panel has #{location} as headline text!"
end

Then(/^search results is accordingly "([^"]*)"$/) do |location|
  assert browser.location_visible?(location), "Cannot validate that direction #{location} is on destination field! "
end
