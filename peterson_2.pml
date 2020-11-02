mtype = { TurnP, TurnQ };
mtype last = TurnP;
bool wantp = false, wantq = false;

active proctype P () {
  do :: skip;
try:    wantp = true;
        last = TurnP;
        /* wantq == false || last == TurnQ; */
        do
          :: wantq == false -> break
          :: else -> last == TurnQ; break
        od;
cs:     wantp = false;
  od
}

active proctype Q () {
  do :: skip;
try:    wantq = true;
        last = TurnQ;
        /* wantp == false || last == TurnP; */
        do
          :: wantp == false -> break
          :: else -> last == TurnP; break
        od;
cs:     wantq = false;
  od
}

ltl safety { []!(P@cs && Q@cs) }

ltl liveness1 { []<>P@cs }

ltl liveness2 { [](P@try -> <>P@cs) }
