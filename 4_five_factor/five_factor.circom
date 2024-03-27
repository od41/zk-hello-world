template IsZero() {
    signal input in;
    signal output out;

    signal inv;

    inv <-- in!=0 ? 1/in : 0;

    out <== -in*inv +1;
    in*out === 0;
}

template IsEqual() {
    signal input in[2];
    signal output out;

    component isz = IsZero();

    in[1] - in[0] ==> isz.in;

    isz.out ==> out;
}

template FactorOfFiveFootgun() {

    signal input in;
    signal output out;

    component eq = IsEqual();
    
    out <== in * 5;

    eq.in[0] <-- out / 5;
    eq.in[1] <-- in;

    eq.out === 0;
}

component main = FactorOfFiveFootgun();