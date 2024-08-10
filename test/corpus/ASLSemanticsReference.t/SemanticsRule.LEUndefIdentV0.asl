=====
ASLSemanticsReference.t/SemanticsRule.LEUndefIdentV0.asl
uses ASLv0's syntax, deprecated
:error
=====
integer main ()
  x = 42;
  y = 3;
  assert y == 3 && x == 42;
  return 0;
  ---
