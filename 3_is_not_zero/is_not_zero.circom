template IsNotZero() {
  signal input in;
  signal output out;

// The IsNotZero template returns 1 if the input signal is non-zero, 
// and zero if the input signal is zero.

  signal inv;

  inv <-- in!=0 ? 0 : 1/in;

  out <== -in*inv +1;
  (in+(-in))*out === 0; // one of input or output is ALWAYS going to be 0
}

component main = IsNotZero();