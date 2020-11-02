# Ticket Terminal

A terminal to buy train tickets.

<p align="center">
  <img src="./assets/screenshot.png" raw=true style="margin-left: auto; margin-right: auto;"/>
</p>

## Setup

Run:
```
bundle install
ruby app.rb
```

Visit:
http://localhost:4567/

## Test

Run:
```
bundle exec rspec
```

## Approach

I wanted to learn Sinatra and thought the idea of a website that looked like a terminal would be interesting.
I also wanted to try to structure the app in a componetized way much like React.

Reconciling Sinatra with a component style architecture had its challenges.
When Sinatra is implemented as a modular application all classes inherit from `Sinatra::Base`.
You can then connect the instances together with `Extensions`/helpers.
However I discovered that custom methods added to a class inherited from `Sinatra::Base` will fail silently when called,
and they already have a method called `render()` which conflicated with the component pattern I was trying to achieve.
Sinatra it seems is geared towards get/post/delete methods only but please let me know if there's another way.
As a workaround I made my `Component` class disconnected from `Sinatra::Base`, meaning I couldn't use `Extensions`/helpers.
Then I used an `AppHelper` module which is included in every `Component` to access the base `App` instance.

In summary, this was an experimental build marrying old and new concepts, resulting in an end product that actually works :)

## Architecture

* Sinatra for light controllers/CRUD
* Components for individual pieces of the app
* Components use writable `@state` and read-only `props` just like React
* Each component knows how to `initialize()` and `render()` itself
