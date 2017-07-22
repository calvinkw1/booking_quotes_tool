# Sonder Booking Quote Project

Sonder is just getting off the ground and we need to know how much to price our apartments (units), and to keep track of the requests that have been made.

This tool will be used by the Sonder customer support to enter reservations that they take by phone and by email.

Your objective is to build the form by which our team will log the booking, and the software that will compute the price.

## Requirements

- The reservation requests should be called inquiries.
- An inquiry should have a rental site.
- The inquiry should have a unit.
- The user should be able to select the unit by the ad name.
- The inquiry should have a price, which is the sum of all _nights_ that the guest stayed in the room. So a stay from May 1st to May 3rd would have two nights.
- The inquiry should store the amount of taxes that were withheld, when the inquiry was made.

1) Let’s not worry about the difference between a booking or an inquiry at this point. Although that difference does exist!

2) A rental site is a site you can book on e.g. Booking.com, Sonder, Expedia etc.

3) This is a product choice you should make, but it’s a good question! How are the UIs different in these two cases? Is one easier to use than another. Note: I understand without prototyping and testing you can’t definitely answer this, but make your best judgement call

4) There are actually tax zones in a city, let’s just assume a constant rate per unit. You can choose where it makes the most sense to store them

## Changelog Notes

### Changes/Additions on Associations and Models
- Added Inquiry model with `belongs_to` assoc. with Unit. Unit `has_many` inquiries. Inquiry has the following columns:
  - rental_site
  - unit_id
  - price
  - tax
  - nights
  - check_in
  - check_out
  - adults
  - children
  - pets
- A number of validations have been set on the `Inquiry` model in order to ensure that an inquiry is never submitted with data that will not be calculated correctly.

### UX
- Visiting `/` will take you to a list of `Inquiries` that displays truncated information.
- Clicking any inquiry's `Unit Name` will bring you to a `Show` page for that inquiry that gives you full details, which mainly includes inquirer contact details. You can also `Edit` or `Destroy` any inquiry from the `Show` page.
- Clicking the `New Inquiry` button takes you to the form to enter in details on a new `Inquiry`.
- The form, for convenience, will render a list of unit ad names alongside radio buttons for selection. Product wise, it seems like this is the most sensible direction for CS reps that are already familiar with unit offerings.
- The form has a number of client side and server side validations to prevent bad data from being submitted.

### Tests
- Tests written with `RSpec` and `Capybara`.
- Tests have been written for:
	- Models
		- `DayPrice` 
		- `Unit`
		- `Inquiry`
	- Views
		- `Index`
		- `New`
- I had originally intended to build out a full test suite across all views, but unfortunately got hung up for quite some time on configuration issues. Turns out that usage of `FactoryGirl`'s `sequence` method requires a call to `FactoryGirl.reload` in order to reset the sequence. I had gotten sidetracked by believing the test data was not being cleaned properly by the `database_cleaner` gem.

### Assumptions
- Added inquirer contact information fields, assuming the CS Reps would need a way to contact the inquirer.
- Guest counts included `Adults`, `Children`, and `Pets`, in the event that price calculation is affected by those counts.
- 

### Things to implement if granted more time
- Full test suite.
- Price per night breakdown on the `Show` page.
- Appearance of a text box upon selection of `Other` in the `Rental site` dropdown in the form.
- `Inquiries` table (Index) to be sorted by `Date Created`