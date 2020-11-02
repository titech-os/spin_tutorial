mtype = { TurnP, TurnQ };
mtype last = TurnP;
bool wantp = false, wantq = false;

active proctype P () {
  do :: skip;
try:    wantp = true;
        last = TurnP;
        wantq == false || last == TurnQ;
cs:     wantp = false;
  od
}

active proctype Q () {
  do :: skip;
try:    wantq = true;
        last = TurnQ;
        wantp == false || last == TurnP;
cs:     wantq = false;
  od
}

ltl safety { []!(P@cs && Q@cs) }

ltl liveness1 { []<>P@cs }

ltl liveness2 { [](P@try -> <>P@cs) }
