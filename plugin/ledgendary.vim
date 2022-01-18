function Transaction()
  let l:transaction = getline('.')
  let l:account = matchstr(transaction, '\(\w\+:\?\)\+')
  let l:amount = matchstr(transaction, '\(-\?\d\+\.\?\)\+')
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

nnoremap <Leader>at :call AlignedTransaction()<CR>
