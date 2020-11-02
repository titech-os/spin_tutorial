mtype = { TurnP, TurnQ };
bool wantp = false, wantq = false;
mtype turn = TurnP;
int ncs = 0;

active proctype P() {
  do :: wantp = true;
        do :: wantq ->
              if :: (turn == TurnQ) ->
                    wantp = false;
                    turn == TurnP;
                    wantp = true;
                 :: else -> skip;
              fi
           :: else -> break;
        od;
progress:
        ncs++;
        assert(ncs == 1);
        ncs--;
        turn = TurnQ;
        wantp = false;
  od
}

active proctype Q() {
  do :: wantq = true;
        do :: wantp -> 
              if :: (turn == TurnP) ->
                    wantq = false;
                    turn == TurnQ;
                    wantq = true;
                 :: else -> skip;
              fi
           :: else -> break;
        od;
        ncs++;
        assert(ncs == 1);
        ncs--;
        turn = TurnP;
        wantq = false;
  od
}
