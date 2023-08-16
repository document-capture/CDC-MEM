# DC+MEM Dimension Helper
Business Central extension to allow Document Capture (DC) to work together with Binary Stream’s Multi Entity Management (MEM).
## Introduction ##
This repository contains a helper extension for the Continia Document Capture (DC) module and changes the order header fields are validated to retain compatibility with Binary Stream’s Multi Entity Management (MEM) module. 
The code will be unregularly maintained or updated.
## Remark ##
You can use this code as it is, without any warranty or support by the repository owner or Continia Software A/S. You can use this app on your own risk.
If you find issues in the code, please report these in the issues list here on Github.
## Documentation ##
**Setup**
- Download the DC+MEM Dimension Helper .app and add to Business Central
‘Extension Management’ / Manage / “Upload Extension”
- Identify Global Dimension 1
‘General Ledger Setup’ / Dimensions / 
- Edit the associated ‘Document Category’ and Edit the master Template to make Global Dimension 1 required and insert on new templates (image 1)


Note: “Code” must be the same as the Dimension Code and “Source Table” must be Dimension Value
The following documents are supported;

Categories: PURCHASE, PURCHORDER, SALES

Types: Purchase Credit Memos, Invoices, Orders, Return Orders, Sales Credit Memos and Orders


****Usage****
- Ensure the Global Dimension 1 field is captured in the Document Journal’s / Document Header area
- Document Journal / “Register” the document through any means to build the transaction
## Changelog ##
**22.0.5.5** – “DC+MEM Dimension Helper”

Update by Continia Software Inc. 
- FindSet parameters updated
- OnBeforeInsert Line events updated to save user changes

**18.4.1.0** – “DC MEM Dimensions” 

Initial release by SIGA Solutions Inc. 
