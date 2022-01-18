if exists("b:current_syntax")
  finish
endif

syntax match ledgerDate /^20[2-9][2-9]-\(0[1-9]\|1[0-2]\)-\(0[1-9]\|[12][0-9]\|3[01]\)/ contained

highlight default link ledgerDate Constant

let b:current_syntax = "ledger"
