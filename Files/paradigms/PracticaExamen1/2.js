const overrides = (obj, p, C) => {
    // .... 
}

class C {
    x() {return 666}
}

obj = new C()
console.log(overrides(obj, 'x', C)) // Should be false

obj.x = 10
console.log(overrides(obj, 'x', C)) // Should be true