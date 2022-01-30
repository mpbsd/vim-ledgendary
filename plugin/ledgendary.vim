function LocalDate()
  let l:local_time = strftime('%c')
  let l:year = matchstr(local_time, '20\([2][2-9]\|[3-9][0-9]$\)')
  let l:month = matchstr(local_time, '\(Jan\|Feb\|Mar\|Apr\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\)')
  if l:month ==# 'Jan'
    let month = '01'
  elseif l:month ==# 'Feb'
    let month = '02'
  elseif l:month ==# 'Mar'
    let month = '03'
  elseif l:month ==# 'Apr'
    let month = '04'
  elseif l:month ==# 'Jun'
    let month = '05'
  elseif l:month ==# 'Jul'
    let month = '06'
  elseif l:month ==# 'Aug'
    let month = '07'
  elseif l:month ==# 'Sep'
    let month = '08'
  elseif l:month ==# 'Oct'
    let month = '09'
  elseif l:month ==# 'Nov'
    let month = '10'
  else
    let month = '12'
  endif
  let l:day = matchstr(local_time, '\(0[1-9]\|[12][0-9]\|3[0-2]\)')
  let l:local_date_iso_format = year . '-' . month . '-' . day
  return local_date_iso_format
endfunction

function InsertLocalDate()
  execute 'normal! 0C' . LocalDate()
endfunction

function Transaction()
  let l:transaction = getline('.')
  let l:account = matchstr(transaction, '\([A-Za-z0-9_:]\+\)')
  let l:amount = matchstr(transaction, '-\?\d\+\.\?\d*'
  return {'account': account, 'amount': amount}
endfunction

function AlignedTransaction()
  let l:indent_by = 2
  let l:line_width = 80
  let l:transaction = Transaction()
  let l:x = strlen(transaction['account'])
  let l:y = strlen(transaction['amount'])
  let l:z = line_width - (indent_by + x + y + 1)
  let l:aligned_transaction = ''
  for i in range(indent_by)
    let aligned_transaction = aligned_transaction . ' '
  endfor
  let aligned_transaction = aligned_transaction . transaction['account']
  for i in range(z)
    let aligned_transaction = aligned_transaction . ' '
  endfor
  let aligned_transaction = aligned_transaction . transaction['amount']
  return aligned_transaction
endfunction

function AlignTransactionInPlace()
  execute 'normal! 0C' . AlignedTransaction()
endfunction

nnoremap <Leader>ld :call InsertLocalDate()<CR>
nnoremap <Leader>at :call AlignTransactionInPlace()<CR>
