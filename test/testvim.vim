call assert_true(&number == 1)
call assert_true(&expandtab == 1)
call assert_true(&smarttab == 0)
call assert_true(&tabstop == 4)
call assert_true(&shiftwidth == 4)
call assert_true(&softtabstop == 4)

if len(v:errors) == 0
  write vimpassed.txt
endif
