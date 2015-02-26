# Pokémon EV Calculator

### [Live demo](http://night.coffee/pokemon/ev/)

This app is a client-side JS website for quickly calculating the number
of Pokémon you must defeat in order to train your target Pokémon with
the specified number of effort values. It takes into account the number
of EVs issued per Pokémon, whether or not you have the Pokérus virus,
and if you are holding a Power Item or the Macho Brace.

It will tell you the number of hordes you must fight, the number of
individual Pokémon, and the number of individual Pokémon you must fight
while not hold any item in order to achieve your desired EV number.

## Technical details

This is an HTML5 application, built with
[Brunch](http://brunch.io) and [Chaplin](http://chaplinjs.org).

* [CoffeeScript version](https://github.com/paulmillr/brunch-with-chaplin) | [JavaScript version](https://github.com/paulmillr/brunch-with-chaplin-js)

## Getting started
* Install (if you don't have them):
    * [Node.js](http://nodejs.org): `brew install node` on OS X
    * [Brunch](http://brunch.io): `npm install -g brunch`
    * [Bower](http://bower.io): `npm install -g bower`
    * Brunch plugins and Bower dependencies: `npm install & bower install`
* Run:
    * `brunch watch --server` — watches the project with continuous rebuild. This will also launch HTTP server with [pushState](https://developer.mozilla.org/en-US/docs/Web/Guide/API/DOM/Manipulating_the_browser_history).
    * `brunch build --production` — builds minified project for production
* Learn:
    * `public/` dir is fully auto-generated and served by HTTP server.  Write your code in `app/` dir.
    * Place static files you want to be copied from `app/assets/` to `public/`.
    * [Brunch site](http://brunch.io), [Chaplin site](http://chaplinjs.org)
    * Set up a .env file containing your deployment details. See the <code>deploy.sh</code> file for more details
    * Run <code>./deploy.sh</code> to rsync the statically generated site up to your server.

## License
The MIT license.

Copyright (c) 2015 Tim Gourley (http://timgourley.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
