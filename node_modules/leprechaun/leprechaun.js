var logSymbols = require('log-symbols');

function leprechaun() {
  console.log.apply(null, arguments);
}

[
  'info',
  'success',
  'warning',
  'error'
].map(function (type) {
  leprechaun[type] = function () {
    var args = Array.prototype.slice.call(arguments);
    args.unshift(logSymbols[type]);
    console.log.apply(null, args);
  };
});

module.exports = leprechaun;
