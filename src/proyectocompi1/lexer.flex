package proyectocompi1;
import java_cup.runtime.Symbol;
import java.io.Reader;
import java.util.*;

%%
%public
%class lexer
%unicode
%line
%column
%char
%ignorecase
%cupsym sym 
%cup
%cupdebug



TK_VARIABLE_TIPO = {TK_INT}|{TK_STRING}|{TK_BOOLEAN}|{TK_CHAR}
TK_BOOLEAN = bool 
TK_STRING = string
TK_CHAR = char
TK_INT = int
TK_ARRAY = array

ENDLINE = \r|\n|\r\n
WHITESPACE = {ENDLINE} | [ \t\f]


CHAR = {LETRA}
STRING = '.*'
DIGIT = [0-9]
INT = {DIGIT}+
LETRA = [a-zA-Z]
ID = {LETRA}({LETRA}|{DIGIT})*

//Lectura y Escritura
TK_INPUT = FFinput
TK_PRINT = FFprint

//switch case
TK_BREAK = break
TK_CASE = case
TK_DEFAULT = default
TK_SWITCH = switch

TK_FOR = for

TK_FUNC = func
TK_RETURN =return

//If Else
TK_IF = if
TK_THEN = then
TK_ELSE = else

//While Case
TK_WHILE = while

TK_TRUE = true
TK_FALSE = false
TK_NULL = null
TK_LPAREN = \(
TK_RPAREN = \)
TK_LBRACE = \{
TK_RBRACE = \}
TK_LBRACK = \[
TK_RBRACK = \]
TK_SEMICOLON = \;
TK_COMMA = \,
TK_DOT = \.
TK_ASIG = \=

//Operadores Logicos
GT = >
LT = <
EQEQ = ==
LTEQ = <=
GTEQ = >=
NOTEQ = !=
TK_OPLOG = GT | LT | EQEQ | LTEQ | GTEQ | NOTEQ

TK_PLUSPLUS = [++]
TK_MINUSMINUS = --

PLUS = \+
MINUS = -
MULT = \*
DIV = \/
MOD = %
TK_OPMAT = PLUS | MINUS | MULT | DIV | MOD

AND = &&
OR = [||]
TK_OPREL = AND | OR


COMMENT_BEGIN = [/**]
COMMENT_END = [**/]

%state COMMENT

%%

<YYINITIAL>{
        {LETRA}                           { System.out.println("LETRA: ");
                                            return new Symbol(sym.LETRA, yychar, yyline); }
        {DIGIT}                           { System.out.println("DIGIT: ");
                                            return new Symbol(sym.DIGIT, yychar, yyline); }
        {CHAR}                            { System.out.println("CHAR: ");
                                            return new Symbol(sym.CHAR, yychar, yyline); }
        {TK_ARRAY}                        { System.out.println("TK_ARRAY: ");
                                            return new Symbol(sym.TK_ARRAY, yychar, yyline); }
	{TK_VARIABLE_TIPO}                { System.out.println("TK_VARIABLE_TIPO: ");
                                            return new Symbol(sym.TK_VARIABLE_TIPO, yychar, yyline); }
	{TK_BOOLEAN}                      { System.out.println("TK_BOOLEAN: ");
                                            return new Symbol(sym.TK_BOOLEAN, yychar, yyline); }
	{TK_BREAK}                        { System.out.println("TK_BREAK: ");
					    return new Symbol(sym.TK_BREAK, yychar, yyline); }
	{TK_CASE}                         { System.out.println("TK_CASE: " + yytext());
                                            return new Symbol(sym.TK_CASE, yychar, yyline); }
	{TK_CHAR}                         { System.out.println("TK_CHAR: " + yytext());
                                            return new Symbol(sym.TK_CHAR, yychar, yyline); }
	{TK_STRING}                       { System.out.println("TK_STRING: " + yytext());
                                            return new Symbol(sym.TK_STRING, yychar, yyline); }
	{TK_FUNC}                         { System.out.println("TK_FUNC: " + yytext());
                                            return new Symbol(sym.TK_FUNC, yychar, yyline); }
	{TK_ELSE}                         { System.out.println("TK_ELSE: " + yytext());
                                            return new Symbol(sym.TK_ELSE, yychar, yyline); }
	{TK_FOR}                          { System.out.println("TK_FOR: " + yytext());
                                            return new Symbol(sym.TK_FOR, yychar, yyline); }
	{TK_DEFAULT}                      { System.out.println("TK_DEFAULT: " + yytext());
                                            return new Symbol(sym.TK_DEFAULT, yychar, yyline); }
	{TK_INT}                          { System.out.println("TK_INT: " + yytext());
                                            return new Symbol(sym.TK_INT, yychar, yyline); }
	{TK_IF}                           { System.out.println("TK_IF: " + yytext());
                                            return new Symbol(sym.TK_IF, yychar, yyline); }
	{TK_THEN}                         { System.out.println("TK_THEN: " + yytext());
                                            return new Symbol(sym.TK_THEN, yychar, yyline); }
	{TK_SWITCH}                       { System.out.println("TK_SWITCH: " + yytext());
                                            return new Symbol(sym.TK_SWITCH, yychar, yyline); }
	{TK_RETURN}                       { System.out.println("TK_RETURN: " + yytext());
                                            return new Symbol(sym.TK_RETURN, yychar, yyline); }
	{TK_WHILE}                        { System.out.println("TK_WHILE: " + yytext());
                                            return new Symbol(sym.TK_WHILE, yychar, yyline); }
	{TK_PRINT}			  { System.out.println("TK_PRINT: " + yytext());
                                            return new Symbol(sym.TK_PRINT, yychar, yyline); }
        {TK_INPUT}			  { System.out.println("TK_INPUT: " + yytext());
                                            return new Symbol(sym.TK_INPUT, yychar, yyline); }
        
	/* boolean literals */
	{TK_TRUE}                         { System.out.println("TK_TRUE: " + yytext());
                                            return new Symbol(sym.TK_TRUE, yychar, yyline); }
	{TK_FALSE}                        { System.out.println("TK_FALSE: " + yytext());
                                            return new Symbol(sym.TK_FALSE, yychar, yyline); }

	/* null literal */
	{TK_NULL}                         { System.out.println("TK_NULL: " + yytext());
                                            return new Symbol(sym.TK_NULL, yychar, yyline); }


	/* separators */
	{TK_LPAREN}                       { System.out.println("TK_LPAREN: " + yytext());
                                            return new Symbol(sym.TK_LPAREN, yychar, yyline); }
	{TK_RPAREN}                       { System.out.println("TK_RPAREN: " + yytext());
                                            return new Symbol(sym.TK_RPAREN, yychar, yyline); }
	{TK_LBRACE}                       { System.out.println("TK_LBRACE: " + yytext());
                                            return new Symbol(sym.TK_LBRACE, yychar, yyline); }
	{TK_RBRACE}                       { System.out.println("TK_RBRACE: " + yytext());
                                            return new Symbol(sym.TK_RBRACE, yychar, yyline); }
	{TK_LBRACK}                       { System.out.println("TK_LBRACK: " + yytext());
                                            return new Symbol(sym.TK_LBRACK, yychar, yyline); }
	{TK_RBRACK}                       { System.out.println("TK_RBRACK: " + yytext());
                                            return new Symbol(sym.TK_RBRACK, yychar, yyline); }
	{TK_SEMICOLON}                    { System.out.println("TK_SEMICOLON: " + yytext());
                                            return new Symbol(sym.TK_SEMICOLON, yychar, yyline); }
	{TK_COMMA}                        { System.out.println("TK_COMMA: " + yytext());
                                            return new Symbol(sym.TK_COMMA, yychar, yyline); }
	{TK_DOT}                          { System.out.println("TK_DOT: " + yytext());
                                            return new Symbol(sym.TK_DOT, yychar, yyline); }

	/* operators */
	{TK_ASIG}                         { System.out.println("TK_ASIG: " + yytext());
                                            return new Symbol(sym.TK_ASIG, yychar, yyline); }
	{TK_OPLOG}                        { System.out.println("TK_OPLOG: " + yytext());
                                            return new Symbol(sym.TK_OPLOG, yychar, yyline); }
	{TK_OPMAT}                        { System.out.println("TK_OPMAT: " + yytext());
                                            return new Symbol(sym.TK_OPMAT, yychar, yyline); }
	{TK_OPREL}                        { System.out.println("TK_OPREL: " + yytext());
                                            return new Symbol(sym.TK_OPREL, yychar, yyline); }
	{TK_PLUSPLUS}                     { System.out.println("TK_PLUSPLUS: " + yytext());
                                            return new Symbol(sym.TK_PLUSPLUS, yychar, yyline); }
	{TK_MINUSMINUS}                   { System.out.println("TK_MINUSMINUS: " + yytext());
                                            return new Symbol(sym.TK_MINUSMINUS, yychar, yyline); }

 	/* numeric literals */
	{ENDLINE}                         {}
	{WHITESPACE}                      {}
	{COMMENT_BEGIN}                   {yybegin(COMMENT);}
	{INT} 				  { System.out.println("INT: " + yytext());
                                            return new Symbol(sym.INT, yychar, yyline, yytext()); }
        {STRING}                          { System.out.println("STRING" + yytext()); 
                                            return new Symbol(sym.STRING, yychar, yyline, yytext()); }
	{ID}                              { System.out.println("ID");
                                            return new Symbol(sym.ID, yychar, yyline, yytext()); }	
	.                                 { System.out.println("Error "+ yytext() +" en la linea "+ yyline + ", columna " + yycolumn);
                                            throw new RuntimeException("Token desconocido: " +yytext()+" . Linea: "+(yyline)+", caracter: "+(yychar)); }
}

<COMMENT>{
    {COMMENT_END}                         {yybegin(YYINITIAL);}
    {COMMENT_BEGIN}                       {/*ignorar*/}
    .                                     {/*ignorar*/}
}