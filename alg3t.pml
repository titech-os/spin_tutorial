bool wantp = false, wantq = false;

active proctype P() {
  wantp = true;
  wantq == false;
  wantp = false;
}

active proctype Q() {
  wantq = true;
  wantp == false;
  wantq = false;
}
