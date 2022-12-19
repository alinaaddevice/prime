# Prime

A Flutter project for calculate `if 64bit number is prime`

## Algorithm

The algorithm to calculate prime number is very easy we just calculate till to sqrt(n), since for BigInt sqrt not defined it's made manually

## Possible improvement

1. Currently there is one isolate for prime checking, we can splite task to more small pieces to be able use all possibilities hardware
2. Prime calculation algorithm can be improved

## Structure

There used DI to be able easy scale the project, I use also repository pattern and bloc. In project minimal dependency `bloc` and `equatable` package all other things written manually, used linter to follow best practies

## Test

There are also unit test, prime number algorithm tested `for first 50 numbers`
