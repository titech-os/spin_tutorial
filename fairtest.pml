active proctype P() {
  do
    :: printf("RED\n");
progress:
       printf("BLUE\n");
  od
}

active proctype Q() {
  do
    :: printf("RED\n");
       printf("BLUE\n");
  od
}
