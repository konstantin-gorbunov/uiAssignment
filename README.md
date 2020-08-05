# Backbase
Backbase UI component technical assignment

# Feedback
1. AmountTextView is created with multiple labels, this makes decimal offset inconsistent and it makes custom formatting harder.
2.  It takes Int as total Amount and uses internal arithmetics to figure out the whole and decimal part instead of using Decimal type.
3.  Format setting API is confusing -> `useISOCode: Bool`, an enum would make things more clear.
4.  Not using currency/decimal NumberFormatter.

# Comments to feedback notest

1. AmountTextView is created with multiple labels, this makes decimal offset inconsistent and it makes custom formatting harder.
- [my comment] 
AmountTextView is an independent component, how it will represent data - one element or several, it is his inner logic. 
I don't see a big advantage in using a one-component UILabel with NSAttributedString instead of three UILabels with proper UI relationship inside AmountTextView container.

2.  It takes Int as total Amount and uses internal arithmetics to figure out the whole and decimal part instead of using Decimal type.
- [my comment] 
Looks like you never met a problem with using a Decimal as currency representation. 
According to requirements from the description, AmountTextView should represent and work only with the euro currency. 
So, met the requirements.

3.  Format setting API is confusing -> `useISOCode: Bool`, an enum would make things more clear.
- [my comment]
good point, but can't be a reason to reject a candidate. 

4.  Not using currency/decimal NumberFormatter.
- [my comment]
- According to requirements, AmountTextView should have special behavior and represent the euro amount described manner.
NumberFormatter will be linked to the current locale or a special locale (manual setup).
I don't need additional dependency in my implementation. 

