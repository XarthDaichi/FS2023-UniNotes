// a
function reduce(a, f, s) {
    // a:[T] f:(R, T) => R s:R
    let value = s;
    for (const e of a) {
        // value += f(value, e); // mi solucion original
        value = f(value, e); // solucion que tiene que ser
    }
    return value;
}

// b
// mi solucion
function map(a, f) { // NO DEBERIA OCURRIR
    for (let e of a) {
        e = f(e); // NO DEBERIA MODIFICAR a PORQUE A ES "INMUTABLE"
    }
    return a
}

// solucion optima
function map(a, f) {
    const arr = [];
    for (const e of a) {
        arr.push( f(e) );
    }
    return arr;
}

// otra solucion optima
function map(a, f) {
    let arr = [];
    for (const e of a) {
        arr = [...arr, f(e)];
    }
    return arr;
}

// tercera solucion optima
function map(a, f) {
    let arr = [];
    for (const e of a) {
        arr = arr.const( f(e) );
    }
    return arr;
}

// c
const every = (a, f) => { // solucion mia
    a.filter(e => f(e)).length === a.length;
}

const every = (a, f) => a.filter( f ).length === a.length; // solucion optima (no crear la lambda)

// otras soluciones
const every = (a, f) => a.reduce(( r, e ) => r && f( e ), true);

const every = (a, f) => a.reduce( (r, e) => f( e ) ? r : false, true);