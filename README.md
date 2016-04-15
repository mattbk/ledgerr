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

Important: Your app will be named and deployed according to the name of the folder it is in. So unless you want your app to be named `ledger`, change the folder name before deploying.

Deploy from project root (run to update)  
`deployApp()`
