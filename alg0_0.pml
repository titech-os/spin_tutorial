bool in_use = false;

active[2] proctype P() {
  do
  :: /* NC */
    in_use == false;
    in_use = true;
    /* CS */
    in_use = false;
  od
}
