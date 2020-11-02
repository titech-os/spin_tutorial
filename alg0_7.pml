bool in_use = false;

active proctype P() {
  do
    :: in_use == false;
       in_use = true;
cs:    in_use = false;
  od
}

active proctype Q() {
  do
    :: in_use == false;
       in_use = true;
cs:    in_use = false;
  od
}

active proctype Observer() {
  atomic{ P@cs && Q@cs -> assert(false) }
}