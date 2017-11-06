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

/*MACROS*/

digit1_9 = [1-9]
digit = [0-9]
/*fraction = {digit}+(\.{digit}+)*/
integer = 0 | [+-]?{digit1_9}{digit}*
number = {integer}

truth_value = "true"|"false"

string = \"\"|\"([a-z]*|[A-Z]*)+\"

%%

/*TOKEN GENERATOR*/

"," { return sf.newSymbol("Comma",sym.COMMA); }
"[" { return sf.newSymbol("Left Square Bracket",sym.LSQBRACKET); }
"]" { return sf.newSymbol("Right Square Bracket",sym.RSQBRACKET); }
"}" { return sf.newSymbol("Right Brace",sym.RBRACE); }
"{" { return sf.newSymbol("Left Brace",sym.LBRACE); }
":" { return sf.newSymbol("Collon",sym.COLLON); }
{truth_value} { return sf.newSymbol("Truth Value",sym.TV); }
"null" { return sf.newSymbol("Null",sym.NULL); }
{number} { return sf.newSymbol("Integral Number",sym.NUMBER); }
{string} { return sf.newSymbol("String",sym.STRING); }
[ \t\r\n\f] { /* ignore white space. */ }
. { System.err.println("Illegal character: "+yytext()); }
