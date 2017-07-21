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
- Added Inquiry model with `belongs_to` association with Unit. Unit `has_many` inquiries.
- Inquiry model uses Date Validator gem for check in/check out date validation