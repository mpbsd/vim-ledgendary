if has(b:current_syntax)
  finish
endif

let b:current_syntax = "ledger"

syntax match ledgerDate "\v^20[2-9][2-9]-(0[1-9]|1[12])-(0[1-9]|1[1-9]|2[0-9])"

highlight link ledgerDate Date
