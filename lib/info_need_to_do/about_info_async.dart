/*

===============================
## Use Cases of NotifierProvider:

1. If provider initialized synchronously, but if u need to initialize provider asynchronously
!better to use AsyncNotifierProvider!

2. In sealed-based state-shape we have no need to have initial state, unlike in enum-based state-shape
(where we need this, because  we use m method "copyWith()", which cannot be called on not initialized object)

===============================




===============================
##

===============================
*/
