mtype = { TurnP, TurnQ };
bool wantp = false, wantq = false;
mtype turn = TurnP;

active proctype P() {
  do :: skip;
try:    wantp = true;
        do :: wantq ->
              if :: (turn == TurnQ) ->
                    wantp = false;
                    turn == TurnP;
                    wantp = true;
                 :: else -> skip;
              fi
           :: else -> break;
        od;
cs:     turn = TurnQ;
        wantp = false;
  od
}

active proctype Q() {
  do :: skip;
try:    wantq = true;
        do :: wantp -> 
              if :: (turn == TurnP) ->
                    wantq = false;
                    turn == TurnQ;
                    wantq = true;
                 :: else -> skip;
              fi
           :: else -> break;
        od;
cs:     turn = TurnP;
        wantq = false;
  od
}


ltl safety { []!(P@cs && Q@cs) }

ltl liveness1 { []<>P@cs }

ltl liveness2 { [](P@try -> <>P@cs) }
