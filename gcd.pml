byte x = 1, y = 1;

active proctype GCD() {
  do
    :: x < 100 -> x++
    :: y < 100 -> y++
    :: break
  od;
loop:
  assert(0 < x && 0 < y);
  printf("x=%d, y=%d\n", x, y);
end:
  if
    :: ( x > y ) -> x = x - y
    :: ( x < y ) -> y = y - x
  fi;
  goto loop;
}

/*
active proctype Watcher() {
  do
    :: timeout ->
       assert(x == y);
       printf("x=%d, y=%d\n", x, y);
       break;
  od
}
*/
