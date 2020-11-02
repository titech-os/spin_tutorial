bool wantp = false, wantq = false;
int ncs = 0;

active proctype P() {
  do
    :: wantp = true;
       do :: wantq == true ->
             wantp = false;
             wantp = true;
          :: else -> break;
       od;
progress:
       ncs++;
       assert(ncs == 1);
       ncs--;
       wantp = false;
  od
}

active proctype Q() {
  do
    :: wantq = true;
       do :: wantp == true ->
             wantq = false;
             wantq = true;
       od;
       ncs++;
       assert(ncs == 1);
       ncs--;
       wantq = false;
  od
}
