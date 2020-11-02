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
  !(ncs <= 1) -> assert(false)
}