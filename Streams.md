---
Topic: Streams
Date: 2023-10-09
Course: Paradigms
tags:
  - notes
  - flashcards
  - paradigms
---
```js
// dentro de stream.mjs

export class Stream {
	#iterable; // esto es para hacer que iterable sea private
	constructor( iterable ) {
		this.#iterable = iterable;
	}

	map( f ) {
		function* gen(iterable) {
			for (const e of iterable) {
				yield f( e );
			}
		}
		return new Stream( gen(this.#iterable) );
	}

	filter( p ) {
		function* gen(iterable) {
			for (const e of iterable) {
				if( p( e ) ) yield e;
			}
		}
		return new Stream( gen(this.#iterable) );
	}

	toList() { // Caution: can only be used with finite iterators
		return [...this.#iterable];
	}
}

// dentro de test_streams.mjs

import {Stream} from './stream.mjs';

let stream = new Stream();

console.log("1:", stream);

const numbers = new Stream([1,2,3,4,5,6,7]);

const numbersPlusTen = numbers.map(n => n + 10)
							  .filter(e => e % 2 === 0)
							  .map(n = > n * 2);

console.log(numbersPlusTen.toList()); // Expected [24,28,32]
```