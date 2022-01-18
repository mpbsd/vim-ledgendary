if exists("b:current_syntax")
  finish
endif

" syn sync fromstart
" syn spell notoplevel

syntax match ledgerDate /^20[2-9][2-9]-\(0[1-9]\|1[0-2]\)-\(0[1-9]\|[12][0-9]\|3[01]\)/hs=s+1,he=e-1

highlight default link ledgerDate

let b:current_syntax = "ledger"
