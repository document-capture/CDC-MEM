# DC+MEM Dimension Helper
Business Central extension to allow Document Capture to work together with Binary Stream’s Multi Entity Management.
## Introduction ##
This repository contains a helper extension for the Continia Document Capture (DC) module and changes the order header fields are validated to retain compatibility with Binary Stream’s Multi Entity Management (MEM) module. 

The code will be unregularly maintained or updated.
## Remark ##
You can use this code as it is, without any warranty or support by the repository owner or Continia Software A/S.<br>
You can use this app on your own risk.

If you find issues in the code, please report these in the issues list here on Github.
## Documentation ##
The following DC transactions are supported;<br>
Document Categories: PURCHASE, PURCHORDER, SALES<br>
Document Types: Purchase Credit Memos, Invoices, Orders, Return Orders, Sales Credit Memos and Orders

**Setup**
- Download the DC+MEM Dimension Helper .app and add to Business Central<br>
‘Extension Management’ / Manage / “Upload Extension”
- Identify Global Dimension 1<br>
‘General Ledger Setup’ / Dimensions / 
- Edit the associated ‘Document Category’ and Edit the master Template to make Global Dimension 1 required and insert on new templates<br>
(see images)

Note: “Code” must be the same as the Dimension Code and “Source Table” must be Dimension Value

**Usage**
- Ensure the Global Dimension 1 field is captured in the Document Journal’s / Document Header area
- Document Journal / “Register” the document through any means to build the transaction
- Demo video<br>
[![Watch the video](https://img.youtube.com/vi/-pGKCP77tw8/hqdefault.jpg)](https://www.youtube.com/embed/-pGKCP77tw8)

## Setup Images ##
<Table>
<TR><TD><b>Image 1 - Template Field Card - Global Dim 1 (ENTITY)</b></TD></TR>
<TR><TD><img src="https://github.com/document-capture/CDC-MEM/assets/141848259/88e6150a-3c00-4595-9585-22bbc1572209" align=left width=50%></TD></TR>

<TR><TD><b>Image 2 - Lookup Source Table Filters - Global Dim 1</b></TD></TR>
<TR><TD><img src="https://github.com/document-capture/CDC-MEM/assets/141848259/751b2d69-96d5-4e30-83a0-1b2b67329b86" align=left width=50%></TD></TR>

<TR><TD><b>Image 3 - Document Journal - Global Dim 1 required</b></TD></TR>
<TR><TD><img src="https://github.com/document-capture/CDC-MEM/assets/141848259/18d330dd-d2e8-49d9-81b3-6eb73cde7f6f" align=left width=50%></TD></TR>
</Table>

## Changelog ##
**22.0.5.5** – "DC+MEM Dimension Helper"<br>
_Update by Continia Software Inc._ 
- FindSet parameters updated
- OnBeforeInsert Line events updated to save user changes

**18.4.1.0** – “DC MEM Dimensions”<br>
_Initial release by SIGA Solutions Inc._ 
