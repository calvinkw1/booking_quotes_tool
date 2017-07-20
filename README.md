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


## Notes

### Changes/Additions on Associations and Models
- Added Inquiry model with belongs_to assoc. with Unit. Unit has_many inquiries. Inquiry has the following columns:
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
