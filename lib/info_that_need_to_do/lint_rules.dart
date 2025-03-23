/*
===============================
## Lint rules, remember next:

1. Generated providers should only depend on other generated providers. 
Failing to do so may break rules such as "provider_dependencies".

2. Notifiers should not have public properties/getters.
Instead, all their public API should be exposed through the `state` property.

3. Providers parameters should have a consistent ==. 
Meaning either the values should be cached, or the parameters should override ==
(?? so have to use const objects or objects with same hash code??)

===============================



===============================
## SUBTREE SCOPING

! at first, look opportunity to avoid using it, by using separate provider or family provider(because subtree scoping is difficult)

===============================
 */
