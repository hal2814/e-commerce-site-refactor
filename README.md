# E-Commerce Application

Maintenance by Nate McGregor
This is an exercise for the purpose of debugging, refactoring, and updating functionality on an AJAX/Rails project.

## Features added

* Added ability to render details and add an item to cart when a product name is clicked.
* Added stylized flash messages using Materialize.

## Bug Fixes

Items not adding to cart: 'Nil can't be coerced into BigDecimal'
  * Changed type value of 'total_price' and 'decimal' in Orders model to decimals instead of strings. When multiplying the price by quantity, quantity needed to be converted to a float.
  * Number of items now properly appears when an item is added to cart
  * Converted quantity to float before multiplying to view cart properly.

Details of product not showing when clicked


### Technology Used

* Bcrypt
* materialize
* Ajax
* Rails
* Ruby
