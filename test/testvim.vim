call assert_true(&number == 1)
call assert_true(&expandtab == 1)
call assert_true(&nosmarttab == 1)
call assert_true(&tabstop == 4)
call assert_true(&shiftwidth == 4)
call assert_true(&softtapstop == 4)

if len(v:errors) == 0
    call execute(':wq vimpassed.txt')
endif
