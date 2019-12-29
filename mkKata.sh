#!/usr/bin/env bash

mkdir $KATA && touch $KATA/index.js && touch $KATA/index.spec.js

echo "
function $KATA(a, b) {
  console.log('index running for $KATA')
}
module.exports = $KATA;
" >> $KATA/index.js

echo "
const index = require('./index');

test('$KATA', () => {
  console.log('test running for $KATA')
});
" >> $KATA/index.spec.js

yarn test --verbose false ./$KATA/index.spec.js --watch
