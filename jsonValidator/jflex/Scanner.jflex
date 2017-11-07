package Example;

import java_cup.runtime.SymbolFactory;
%%
%cup
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
digit1 = [1-9]
integer = 0 | -?{digit1}{digit}*
exponent = [eE][-+]?{digit}+
fraction = \.?{digit}+
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

"," { return sf.newSymbol("Comma",sym.COMMA); }
"[" { return sf.newSymbol("Left Square Bracket",sym.LSQBRACKET); }
"]" { return sf.newSymbol("Right Square Bracket",sym.RSQBRACKET); }
"}" { return sf.newSymbol("Right Brace",sym.RBRACE); }
"{" { return sf.newSymbol("Left Brace",sym.LBRACE); }
":" { return sf.newSymbol("Collon",sym.COLLON); }
"true" { return sf.newSymbol("True",sym.TRUE); }
"false" { return sf.newSymbol("False",sym.FALSE); }
"null" { return sf.newSymbol("Null",sym.NULL); }
{number} { return sf.newSymbol("Integral Number",sym.NUMBER); }
{string} { return sf.newSymbol("String",sym.STRING); }
[ \t\r\n\f] { /* ignore white space. */ }
. { System.err.println("Illegal character: "+ yytext() + "\nLine: " + (yyline + 1)); }
