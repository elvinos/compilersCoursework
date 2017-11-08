# Introduction

# Compiler Creation

The objective of the project was to create a lexer and parser for JSON (JavaScript Object Notation) using JFlex and CUP.

## Scanner.jflex - *Lexical Analysis*

Lexical analysis is the first step in the compilation. This is where source stream code is converted and grouped into tokens \cite{lexicalAna}. A lexical analyser holds a set of regular expressions and actions as a specification. The lexical analyser will then create a program named a lexer, which will read and match an input file against it's specification.

JFlex is a lexical analyser generator created using the Java language \cite{JFlexJFl92:online}, used to create the JSON parser in this report. JFlex uses two constructors Reader and InputStream. This represents objects in a form that can be lexically analysed. Two examples include a StringReader which reads input from a String and InputStream which reads text. The JFlex lexical analyser will then execute a method to assign tokens, looping through the input file to match against regular expressions \cite{lexicalAna}.

### Macros

In order to create a comprehensive list of regular expressions for JSON, the JSON.org \cite{JSON95:online} documentation was used. JSON is built on two universal data structures:
- A collection of name or value pairs
- An ordered list of value

The forms of these structures were used to create the list of regular expressions. Macros were used to break down and generalise regular expressions, making them both readable and simple. The REGEX language is used to  The following macros and a description of their definition is given


- **Number:** All numbers are defined as an integer which can then be followed by a fraction (decimal number), exponent (scientific notation) or both. The rules for a number are:
  - An integer must either be equal to zero or start with a non-zero digit
  - An integer can be negative using the *-* sign where positive is donated using no sign
  - An exponent can either be *e* or *E* followed where a sign can be used
  - fraction always follows an integer and can be any digit
- **Strings and Characters:** All characters are converted into strings, surrounding the character (or list of characters) in quotation marks. Characters are made up of:
  - *Unicode Characters*: Allows any unicode character except **\ or "**
  - *Escape Characters*: These are the control characters made up of \\ \" \/ \b \f \n \r \t
  - *Unicode Numbers*: These are numbers made up of \u followed be


- Choice for printing (print in executions or printed in injected Java as she had)

### Tokens
*Claud
Sequence of characters that forms a unit in the grammar of the programming language*
 - Dealing with ambiguity
 - Token choices vs terminal/ non terminal

## Parser.cup - *Syntax Analysis*
*Claud*
 - Starting symbol
 - context free grammar

## Testing
*alex*

# Conclusions
