# leprechaun

> A simple, lightweight, and colorful logging utility

<img src="https://cdn.rawgit.com/websperts/leprechaun/master/logo.svg" alt="Leprechaun" width="150" height="150">

`leprechaun()` itself is nothing more than an alias for `console.log()`. `leprechaun.info()`, `leprechaun.success()`, `leprechaun.warning()`, and `leprechaun.error()` prepend appropriate, colored icons in front of the message(s). Well suited for CLIs and beautiful just like a leprechaun’s hidden pot of gold at the end of the rainbow.

## Install

```sh
npm install leprechaun --save-dev
```

## Usage

```js
var log = require('leprechaun');

var a = 'Test';
var b = 1337;
var c = true;

log(a, b, c);

log.info(a, b, c);

log.success(a, b, c);

log.warning(a, b, c);

log.error(a, b, c);
```

## Changelog

* 0.0.2
  * Fix logo within README
* 0.0.1
	* Initial version

## TODO

- Documentation
- Tests

## License

Copyright (c) 2016 [websperts](http://websperts.com/)  
Licensed under the MIT license.

See LICENSE for more info.
