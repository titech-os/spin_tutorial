bool in_use = false;

active[2] proctype P() {
  do
    :: in_use == false;
       in_use = true;
cs:    in_use = false
  od
}

never safety {    /* ![]!(P[0]@cs && P[1]@cs) */
T0_init:
  do
    :: atomic { ((P[0]@cs && P[1]@cs)) -> assert(!((P[0]@cs && P[1]@cs))) }
    :: (1) -> goto T0_init
  od;
accept_all:
  skip
}
