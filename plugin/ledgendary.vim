function Transaction()
  let l:transaction = getline('.')
  let l:account = matchstr(transaction, '\(\w\+:\?\)\+')
  let l:amount = matchstr(transaction, '\(-\?\d\+\.\?\)\+')
  return {'account': account, 'amount': amount}
endfunction

function TransactionAligned()
  let l:indent_by = 2
  let l:line_width = 80
  let l:transaction = Transaction()
  let l:x = strlen(transaction['account'])
  let l:y = strlen(transaction['amount'])
  let l:z = line_width - (indent_by + x + y + 1)
  let l:transaction_aligned = ''
  for i in range(indent_by)
    let transaction_aligned = transaction_aligned . ' '
  endfor
  let transaction_aligned = transaction_aligned . transaction['account']
  for i in range(z)
    let transaction_aligned = transaction_aligned . ' '
  endfor
  let transaction_aligned = transaction_aligned . transaction['amount']
  return transaction_aligned
endfunction

nnoremap <Leader>t :echo TransactionAligned()<CR>
