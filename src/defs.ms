.\" File with custom definitions such as macros, strings etc.
.\"
.\" Bullet item.
.de BL
.IP \(bu 3
..
.\"
.ds rev 1.0

.\" For numbers in headings in TOC.
.de XN-REPLACEMENT
.  XN-INIT \" does nothing by default
.  if '\\*[.T]'pdf' .pdfbookmark \\n[nh*hl] "\\$*"
.  XH-UPDATE-TOC \\n[nh*hl] "\\*[SN] \\$*"
.  nop \&\\$*
..
