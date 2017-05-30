# Server examples in Elixir with tests

[![Build Status](https://travis-ci.org/xymbol/otp-examples.svg?branch=master)](https://travis-ci.org/xymbol/otp-examples)

A number of code examples with accompanying tests written for the “OTP,
Concurrency and Testing Strategies” talk,
[presented](https://www.meetup.com/montrealelixir/events/238411707/) in Montreal
Elixir, April 12th, 2017. Slides are
[available](https://speakerdeck.com/xymbol/otp-concurrency-and-testing-strategies)
for this talk.

## What's included

* [`adder`](adder): server to add values and return total
* [`blog`](blog): counter server added to a Phoenix app
* [`calculator`](calculator): simple stack calculator server
* [`counter`](counter): shared counter server
* [`stack`](stack): stack server using only primitives
* [`tick`](tick): server to demonstrate timed sends
* [`writer`](writer): file writer and reader server

## How to use interactively

For each example, do `iex -S mix` from the project folder:

```elixir
iex> {:ok, pid} = Counter.start_link
iex> Counter.read pid
iex> Counter.stop pid
```

## How to run tests

For each example, do `mix test` to run tests. To run all tests in all examples,
do `mix test` from the parent folder.

## Author

[Adrián Mugnolo](https://github.com/xymbol)

## License

These examples are released under the MIT license. See [LICENSE](LICENSE).
