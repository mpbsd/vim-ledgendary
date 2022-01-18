if has(b:current_syntax)
  finish
endif

let b:current_syntax = "ledger"

syntax match ledgerDate /\v^20[2-9][2-9]-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])/
highlight link ledgerDate Date
