= Overview

== Scope

This document specifies the syntax and semantics of the Functional Bus Description Language (FBDL).

== Purpose

This document is intended for the implementers of tools supporting the language and for users of the language.
The focus is on defining the valid language constructs, their meanings and implications for the hardware and software that is specified or configured, how compliant tools are required to behave, and how to use the language.

== Motivation

Describing and managing registers can be a tedious and error-prone task.
The information about registers is utilized by software, hardware, and verification engineers.
Typically a specification of the registers is designed by the hardware designer or system architect.
During the design and implementation phases, it changes multiple times due to different reasons such as bugs, requirement changes, technical limitations, or user feedback.
A simple change in a single register may imply adjustments in both hardware and software.
These adjustments cost money and time.

Several formal and informal tools exist to address issues related to register management.
However, they all share the same concept of describing registers at a very low level.
That is, the user has to implicitly define the layout of the registers.
For example, in the case of a register containing multiple statuses, its the user responsibility to specify the bit position for every status.

The FBDL is different in this term.
The user specifies the functionalities that must be provided by the data stored in the registers.
The register layout is automatically generated based on the functional requirements.
Such an approach increases the amount of automatically generated hardware description and software code and decreases the amount of code requiring manual implementation compared to the register-centric approach.
Not only the register masks, addresses, and single read and write functions can be generated, but complete custom functions with optimized access methods.
This, in turn, leads to shorter design iterations and fewer bugs.

== Word usage

The terms #quote[must], #quote[must not], #quote[required], #quote[shall], #quote[shall not], #quote[should], #quote[should not], #quote[recommended], #quote[may], and #quote[optional] in this document are to be interpreted as described in the IETF Best Practices Document 14, RFC 2119.1.

== Syntactic description

The formal syntax of the FBDL is described by means of context-free syntax using a simple variant of the Backus-Naur Form (BNF).
In particular:

#set enum(numbering: "a)")

+ Lowercase words in `constant-width` font, some containing embedded underscores, are used to denote syntactic categories, for example: \
  #h(2em) `single_import_statement` \
  Whenever the name of a syntactic category is used, apart from the syntax rules themselves, underscores are replaced with spaces thus, "single import statement" would appear in the narrative description when referring to the syntactic category.
  
+ Boldface words are used to denote keywords, for example: \
  #h(2em) *mask* \
  Keywords shall be used only in those places indicated by the syntax.

+ A production consists of a left-hand side, the symbol #quote[::=] (which is read as can be replaced by), and a right-hand side.
  The left-hand side of a production is always a syntactic category, the right-hand side is a replacement rule.
  The meaning of a production is a textual-replacement rule.
  Any occurrence of the left-hand side may be replaced by an instance of the right-hand side.

+ A vertical bar ( | ) separates alternative items on the right-hand side of a production unless it occurs immediately after an opening brace, in which case it stands for itself, for example: \
  #h(2em) `decimal_digit ::= zero_digit | non_zero_decimal_digit` \
  #h(2em) `choices ::= choice { | choice }` \
  In the first instance, an occurrence of decimal digit can be replaced by either zero digit or non zero decimal digit.
  In the second case, "choices" can be replaced by a list of "choice", separated by vertical bars, see item f) for the meaning of braces.

+ Square brackets [ ] enclose optional items on the right-hand side of a production.
  Note, however, sometimes square brackets in the right-hand side of the production are part of the syntax.
  In such cases bold font is used.

+ Braces { } enclose a repeated item or items on the right-hand side of a production.
  The items may appear zero or more times.

+ The term _declared identifier_ is used for any occurrence of an identifier that already denotes some declared item (declared by a user or by specification, for example, built-in function name).

