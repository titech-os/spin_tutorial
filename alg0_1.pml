bool in_use = false;

active proctype P() {
  do
    :: printf("P: NC\n");
       in_use == false;
       in_use = true;
       printf("P: CS\n");
       in_use = false;
  od
}

active proctype Q() {
  do
    :: printf("Q: NC\n");
       in_use == false;
       in_use = true;
       printf("Q: CS\n");
       in_use = false;
  od
}