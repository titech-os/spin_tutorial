bool in_use = false;
int ncs = 0;

active[2] proctype P() {
  do
    :: in_use == false;
       in_use = true;
       ncs++;
       ncs--;
       in_use = false;
  od
}

active proctype Observer() {
  atomic{ !(ncs <= 1) -> assert(false) }
}

/*
active proctype Observer() {
  do
    :: ncs <= 1 -> skip
    :: else -> break
  od;
  assert(false)
}
*/

/*
active proctype Observer() {
  do
    :: assert(ncs <= 1)
  od
}
*/
