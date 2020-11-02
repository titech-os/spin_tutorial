bool wantp = false, wantq = false;

active proctype P() {
  do
    :: skip;
try:   wantp = true;
       do :: wantq == true ->
             wantp = false;
             wantp = true;
          :: else -> break;
       od;
cs:    wantp = false;
  od
}

active proctype Q() {
  do
    :: skip;
try:   wantq = true;
       do :: wantp == true ->
             wantq = false;
             wantq = true;
       od;
cs:    wantq = false;
  od
}

ltl safety { []!(P@cs && Q@cs) }

ltl liveness1 { []<>P@cs }

ltl liveness2 { [](P@try -> <>P@cs) }
