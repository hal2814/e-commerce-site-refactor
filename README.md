# README

E-commerce site. Uses `bcrypt` and `materialize`. There's a seed file. Set up your own admin. If you have questions, I'll be in Bali with no email. Ask someone else.

To set up:

* `rake db:setup`

* Sorry, didn't get around to tests. It mostly works. There might be a few bugs.


# Bug Fixes

'Nil can't be coerced into BigDecimal'
  * Changed type value of 'total_price' and 'decimal' in Orders model to decimals instead of strings.
