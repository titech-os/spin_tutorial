bool in_use = false;

active[2] proctype P() {
  do
    :: in_use == false;
       in_use = true;
cs:    in_use = false;
  od
}

active proctype Observer() {
  atomic{ P[0]@cs && P[1]@cs -> assert(false) }
}