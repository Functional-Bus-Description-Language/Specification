.\" File with document configuration.
.\"
.\" Base point size.
.nr PS 10
.\" Space between paragraphs.
.nr PD 0.5v
.\"
.\" Generate headers in larger point sizes, for NH levels < 4,
.\" with point size increasing by 2p, for each lesser NH level.
.\"
.nr GROWPS 4
.nr PSINCR 2p
.\"
.\" Headers
.\"
.EH '\s9Rev. \*[rev]'%'FBDL Specification'
.OH '\s9FBDL Specification'%'Rev. \*[rev]'
.\" Add document identification meta-data
.\"
.pdfinfo /Title     Functional Bus Description Language - Specification
.\".pdfinfo /Author    Michal Kruszewski
.\".pdfinfo /Subject   Tips and Techniques for Exploiting PDF Features with GNU Troff
.\".pdfinfo /Keywords  groff troff PDF pdfmark
