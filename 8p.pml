#define COLS 3
#define ROWS 3
#define POS(x, y) ((x) + (y) * COLS)
#define GOAL ( b[0] == 1 && b[1] == 2 && b[2] == 3 && \
               b[3] == 4 && b[4] == 5 && b[5] == 6 && \
               b[6] == 7 && b[7] == 8 && b[8] == 0 )
               
active proctype EightPuzzle() {
  byte b[COLS * ROWS] = { /* problem (space : 0) */
    2, 1, 3,
    4, 5, 6,
    7, 8, 0
  };
  byte x = 2, y = 2; /* initial position of the space */

  do
    :: GOAL ->  assert(false)
    :: else -> if
                 :: x > 0 ->
                    atomic { /* move right */
                      b[POS(x, y)] = b[POS(x - 1, y)];
                      b[POS(x - 1, y)] = 0;
                      x--
                    }
                 :: x < COLS - 1 ->
                    atomic { /* move left */
                      b[POS(x, y)] = b[POS(x + 1, y)];
                      b[POS(x + 1, y)] = 0;
                      x++
                    }
                 :: y > 0 ->
                    atomic { /* move up */
                      b[POS(x, y)] = b[POS(x, y - 1)];
                      b[POS(x, y - 1)] = 0;
                      y--
                    }
                 :: y < ROWS - 1 ->
                    atomic { /* move down */
                      b[POS(x, y)] = b[POS(x, y + 1)];
                      b[POS(x, y + 1)] = 0;
                      y++
                    }
               fi
  od
}