# ledgerr
R functions for single-entry-ish bookkeeping reports.

Work in progress.

## Input format

Uses Google Sheets for data entry, R for reporting and analysis.

|Date|Ref No.|Payee|Memo|Class|Debit|Credit|Bank|Reconciliation Status|Balance|Type|Account|
|--- |---    |---  |--- |---  |---  |---   |--- |---                  |---    |--- |---    | 

## Deployment to shinyapps.io

Authorize your computer (run once):   
`install.packages('rsconnect')`  
`library(rsconnect)`  
`rsconnect::setAccountInfo(name='<USERNAME>',
			  token='<TOKEN>',
			  secret='<SECRET>')`


Deploy from project root (run to update)  
`deployApp()`
