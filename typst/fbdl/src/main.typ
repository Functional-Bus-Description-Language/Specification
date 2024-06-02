#set text(
  //font: "Open Sans",
  size: 11pt
)

#set document(
  title: [Functional Bus Description Language - Specification],
  author: "Michał Kruszewski"
)

#import "vars.typ"

#include "cover.typ"

#set page(
  numbering: "1",
  header: [
    #text(9pt)[Rev. #vars.rev]
    #h(1fr)
    #text(9pt)[FBDL Specification]
  ]
)

#set heading(
  numbering: "1.1.1"
)

#set par(justify: true)

#outline(indent: 1em)


#set raw(syntaxes: "fbdl.sublime-syntax")

#include "participants.typ"
#include "glossary.typ"
#include "overview.typ"
#include "references.typ"
#include "concepts.typ"
#include "lexical-elements.typ"
#include "data-types.typ"
#include "expressions.typ"
#include "functionalities/functionalities.typ"
#include "parametrization.typ"
