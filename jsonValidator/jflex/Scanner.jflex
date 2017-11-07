package Example;

import java_cup.runtime.SymbolFactory;
%%
%cup
%unicode
%class Scanner
%{
	public Scanner(java.io.InputStream r, SymbolFactory sf){
		this(r);
		this.sf=sf;
	}
	private SymbolFactory sf;
%}
%eofval{
    return sf.newSymbol("EOF",sym.EOF);
%eofval}

/*
* MACROS
*/

// All Numbers
digit = [0-9]
digit1_9 = [1-9]
integer = 0 | -?{digit1_9}{digit}*
exponent = [eE][-+]?{digit}+
fraction = \.{digit}+
number = {integer}{fraction}?{exponent}?

// Strings and Characters
unichar = [^\\\"\u0000-\u001f]
escapechar = \\[\\\"\/bfnrt]
unicode = \\u[0-9A-Fa-f]{4}
char = {unichar} | {escapechar} | {unicode}
string = \"{char}*\"

%%

/*
*TOKEN GENERATOR
*/

//Binary Operations
"," { return sf.newSymbol("Comma",sym.COMMA); }
":" { return sf.newSymbol("Collon",sym.COLLON); }

//Array
"[" { return sf.newSymbol("Left Square Bracket",sym.LSQBRACKET); }
"]" { return sf.newSymbol("Right Square Bracket",sym.RSQBRACKET); }

//Object
"}" { return sf.newSymbol("Right Brace",sym.RBRACE); }
"{" { return sf.newSymbol("Left Brace",sym.LBRACE); }

//Truth Values
"true" { return sf.newSymbol("True",sym.TRUE); }
"false" { return sf.newSymbol("False",sym.FALSE); }
"null" { return sf.newSymbol("Null",sym.NULL); }

//Greater tokens formed of macros
{number} { return sf.newSymbol("Integral Number",sym.NUMBER); }
{string} { return sf.newSymbol("String",sym.STRING); }

[ \t\r\n\f] { /* ignore white space. */ }

//Prints the line where the illegal character is found.
. { System.err.println("Illegal character: "+ yytext() + "\nLine: " + (yyline + 1)); }
