function Transaction()
  let l:transaction = getline('.')
  let l:account = matchstr(transaction, '\(\w\+:\?\)\+')
  let l:amount = matchstr(transaction, '\(\d\+\.\?\)\+')
  return {'account': account, 'amount': amount}
endfunction

nnoremap <Leader>t :echo Transaction()<CR>
