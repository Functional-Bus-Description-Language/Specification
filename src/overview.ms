.bp
.NH
.XN Overview
.
.NH 2
.XN Scope
.LP
This document specifies the syntax and semantics of the Functional Bus Description Language (FBDL).
.
.NH 2
.XN Purpose
.LP
This document is intended for the implementers of tools supporting the language and for users of the language.
The focus is on defining the valid language constructs, their meanings and implications for the hardware and software that is specified or configured, how compliant tools are required to behave, and how to use the language.
.
.NH 2
.XN "Word usage"
.LP
The terms "must", "must not", "required", "shall", "shall not", "should", "should not", "recommended", "may", and "optional" in this document are to be interpreted as described in the IETF Best Practices Document 14, RFC 2119.1.
.
.NH 2
.XN "Syntactic description"
.LP
The formal syntax of the FBDL is described by means of context-free syntax using a simple variant of the Backus-Naur Form (BNF).
In particular:
.IP a)
Lowercase words in \f[CW]constant-width\f[] font, some containing embedded underscores, are used to denote syntactic categories, for example:
.sp 0.5
    \f[CW]single_import_statement\f[]
.sp 0.5
Whenever the name of a syntactic category is used, apart from the syntax rules themselves, underscores are replaced with spaces thus, "single import statement" would appear in the narrative description when referring to the syntactic category.
.IP b)
Boldface words are used to denote keywords, for example:
.sp 0.5
    \f[B]mask\f[]
.sp 0.5
Keywords shall be used only in those places indicated by the syntax.
.IP c)
A production consists of a left-hand side, the symbol "::=" (which is read as can be replaced by), and a right-hand side.
The left-hand side of a production is always a syntactic category, the right-hand side is a replacement rule.
The meaning of a production is a textual-replacement rule.
Any occurrence of the left-hand side may be replaced by an instance of the right-hand side.
.IP d)
A vertical bar ( | ) separates alternative items on the right-hand side of a production unless it occurs immediately after an opening brace, in which case it stands for itself, for example:
.sp 0.5
    \f[CW]decimal_digit ::= zero_digit | non_zero_decimal_digit\f[]
.br
    \f[CW]choices ::= choice { | choice }\f[]
.sp 0.5
In the first instance, an occurrence of decimal digit can be replaced by either zero digit or non zero decimal digit.
In the second case, "choices" can be replaced by a list of "choice", separated by vertical bars, see item f) for the meaning of braces.
.IP e)
Square brackets [ ] enclose optional items on the right-hand side of a production.
For example, the following two productions are equivalent:
.sp 0.5
    \f[CW]parameters_list ::= ([parameters])\f[]
.br
    \f[CW]parameters_list ::= () | (parameters)\f[]
.sp 0.5
Note, however, sometimes square brackets in the right-hand side of the production are part of the syntax.
In such cases bold font is used.
.IP f)
Braces { } enclose a repeated item or items on the right-hand side of a production.
The items may appear zero or more times.
.IP g)
The term \f[I]declared identifier\f[] is used for any occurrence of an identier that already denotes some declared item.
