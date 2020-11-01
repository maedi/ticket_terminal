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

I wanted to learn Sinatra and thought the idea of a site that looked like a terminal would be interesting.
I wanted to try to structure the app in a componetized way much like React.

Reconciling a React component-style with Sinatra was a bit of a challenge.
While you can add methods to a class inherited from Sinatra::Base, when called they will fail silently.
So I created a Component class that wasn't connected to Sinatra at all.
This made it hard to connect the components together as I couldn't use Extensions.
As a workaround I used an AppHelper module which is included in every Component.
