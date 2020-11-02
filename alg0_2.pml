bool in_use = false;
int ncs = 0;

active proctype P() {
  do
    :: /* printf("P: NC\n"); */
       in_use == false;
       in_use = true;
       ncs++;
       /* printf("P: CS\n"); */
       assert(ncs == 1);
       ncs--;
       in_use = false;
  od
}

active proctype Q() {
  do
    :: /* printf("Q: NC\n"); */
       in_use == false;
       in_use = true;
       ncs++;
       /* printf("Q: CS\n"); */
       assert(ncs == 1);
       ncs--;
       in_use = false;
  od
}