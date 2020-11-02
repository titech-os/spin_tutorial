bool wantp = false, wantq = false;
int ncs = 0;

active proctype P() {
  do
    :: wantp = true;
       wantq == false;
       ncs++;
       assert(ncs == 1);
       ncs--;
       wantp = false;
  od
}

active proctype Q() {
  do
    :: wantq = true;
       wantp == false;
       ncs++;
       assert(ncs == 1);
       ncs--;
       wantq = false;
  od
}
