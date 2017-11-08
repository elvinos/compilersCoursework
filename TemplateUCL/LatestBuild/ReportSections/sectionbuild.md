# Introduction

# Compiler Creation

## Scanner.jflex - *Lexical Analysis*

Lexical analysis is the first step in the compilation. This is where source stream code is converted and grouped into tokens \cite{lexicalAna}. A lexical analyser holds a set of regular expressions and actions as a specification. The lexical analyser will then create a program named a lexer, which will read and match an input file against it's specification.

JFlex is a lexical analyser generator created using the Java language \cite{JFlexJFl92:online}, used to create the JSON parser in this report. JFlex uses two constructors Reader and InputStream. This represents objects in a form that can be lexically analysed. Two examples include a StringReader which reads input from a String and InputStream which reads text. The JFlex lexical analyser will then execute a method to assign tokens, looping through the input file to match against regular expressions \cite{lexicalAna}.


*alex*
Descriptions of systems
- Choice for printing (print in executions or printed in injected Java as she had)

### Macros
*alex*
- *numbers* Choose to allow numbers to have an infinite number of zeros in front of them
- Macros for number inline with the JSON.org specification for number

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
