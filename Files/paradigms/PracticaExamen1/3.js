const avg_promise = ap => {
    // ...
}

const ap = [10, 20, 30].map( n => Promise.resolve(n) )
avg_promise(ap) // expected outputs 20