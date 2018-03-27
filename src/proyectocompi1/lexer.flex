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


//Inicio y final
TK_START = start
TK_END = end

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
TK_COMILLA = \"

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
TK_ELSEIF = elseif

//While Case
TK_WHILE = while

TK_TRUE = true
TK_FALSE = false
BOOLEAN = {TK_TRUE}|{TK_FALSE}
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
TK_ADDLESS = TK_PLUSPLUS | TK_MINUSMINUS

PLUS = \+
MINUS = -
MULT = \*
DIV = \/
MOD = %
TK_OPMAT = MULT | DIV | MOD

AND = &&
OR = [||]
TK_OPREL = AND | OR

OPREL_NOT = \!


COMMENT_BEGIN = [/**]
COMMENT_END = [**/]

%state COMMENT

%%

<YYINITIAL>{
        {TK_COMILLA}                      {return new Symbol(sym.TK_COMILLA, yycolumn + 1, yyline + 1); }
        {TK_ELSEIF}                       {return new Symbol(sym.TK_ELSEIF, yycolumn + 1, yyline + 1); }
        {PLUS}                            {return new Symbol(sym.PLUS, yycolumn + 1, yyline + 1); }
        {MINUS}                           {return new Symbol(sym.MINUS, yycolumn + 1, yyline + 1); }
        {OPREL_NOT}                       {return new Symbol(sym.OPREL_NOT, yycolumn + 1, yyline + 1); }
        {BOOLEAN}                         {return new Symbol(sym.BOOLEAN, yycolumn + 1, yyline + 1); }
        {OR}                              {return new Symbol(sym.OR, yycolumn + 1, yyline + 1); }
        {AND}                             {return new Symbol(sym.AND, yycolumn + 1, yyline + 1); }
        {TK_START}                        {return new Symbol(sym.TK_START, yycolumn + 1, yyline + 1); }
        {TK_END}                          {return new Symbol(sym.TK_END, yycolumn + 1, yyline + 1); }
        {LETRA}                           {return new Symbol(sym.LETRA, yycolumn + 1, yyline + 1); }
        {DIGIT}                           {return new Symbol(sym.DIGIT, yycolumn + 1, yyline + 1); }
        {CHAR}                            {return new Symbol(sym.CHAR, yycolumn + 1, yyline + 1); }
        {TK_ARRAY}                        {return new Symbol(sym.TK_ARRAY, yycolumn + 1, yyline + 1); }
	{TK_VARIABLE_TIPO}                {return new Symbol(sym.TK_VARIABLE_TIPO, yycolumn + 1, yyline + 1); }
	{TK_BOOLEAN}                      {return new Symbol(sym.TK_BOOLEAN, yycolumn + 1, yyline + 1); }
	{TK_BREAK}                        {return new Symbol(sym.TK_BREAK, yycolumn + 1, yyline + 1); }
	{TK_CASE}                         {return new Symbol(sym.TK_CASE, yycolumn + 1, yyline + 1); }
	{TK_CHAR}                         {return new Symbol(sym.TK_CHAR, yycolumn + 1, yyline + 1); }
	{TK_STRING}                       {return new Symbol(sym.TK_STRING, yycolumn + 1, yyline + 1); }
	{TK_FUNC}                         {return new Symbol(sym.TK_FUNC, yycolumn + 1, yyline + 1); }
	{TK_ELSE}                         {return new Symbol(sym.TK_ELSE, yycolumn + 1, yyline + 1); }
	{TK_FOR}                          {return new Symbol(sym.TK_FOR, yycolumn + 1, yyline + 1); }
	{TK_DEFAULT}                      {return new Symbol(sym.TK_DEFAULT, yycolumn + 1, yyline + 1); }
	{TK_INT}                          {return new Symbol(sym.TK_INT, yycolumn + 1, yyline + 1); }
	{TK_IF}                           {return new Symbol(sym.TK_IF, yycolumn + 1, yyline + 1); }
	{TK_THEN}                         {return new Symbol(sym.TK_THEN, yycolumn + 1, yyline + 1); }
	{TK_SWITCH}                       {return new Symbol(sym.TK_SWITCH, yycolumn + 1, yyline + 1); }
	{TK_RETURN}                       {return new Symbol(sym.TK_RETURN, yycolumn + 1, yyline + 1); }
	{TK_WHILE}                        {return new Symbol(sym.TK_WHILE, yycolumn + 1, yyline + 1); }
	{TK_PRINT}			  {return new Symbol(sym.TK_PRINT, yycolumn + 1, yyline + 1); }
        {TK_INPUT}			  {return new Symbol(sym.TK_INPUT, yycolumn + 1, yyline + 1); }
        
	/* boolean literals */
	{TK_TRUE}                         {return new Symbol(sym.TK_TRUE, yycolumn + 1, yyline + 1); }
	{TK_FALSE}                        {return new Symbol(sym.TK_FALSE, yycolumn + 1, yyline + 1); }

	/* null literal */
	{TK_NULL}                         {return new Symbol(sym.TK_NULL, yycolumn + 1, yyline + 1); }


	/* separators */
	{TK_LPAREN}                       {return new Symbol(sym.TK_LPAREN, yycolumn + 1, yyline + 1); }
	{TK_RPAREN}                       {return new Symbol(sym.TK_RPAREN, yycolumn + 1, yyline + 1); }
	{TK_LBRACE}                       {return new Symbol(sym.TK_LBRACE, yycolumn + 1, yyline + 1); }
	{TK_RBRACE}                       {return new Symbol(sym.TK_RBRACE, yycolumn + 1, yyline + 1); }
	{TK_LBRACK}                       {return new Symbol(sym.TK_LBRACK, yycolumn + 1, yyline + 1); }
	{TK_RBRACK}                       {return new Symbol(sym.TK_RBRACK, yycolumn + 1, yyline + 1); }
	{TK_SEMICOLON}                    {return new Symbol(sym.TK_SEMICOLON, yycolumn + 1, yyline + 1); }
	{TK_COMMA}                        {return new Symbol(sym.TK_COMMA, yycolumn + 1, yyline + 1); }
	{TK_DOT}                          {return new Symbol(sym.TK_DOT, yycolumn + 1, yyline + 1); }

	/* operators */
	{TK_ASIG}                         {return new Symbol(sym.TK_ASIG, yycolumn + 1, yyline + 1); }
	{TK_OPLOG}                        {return new Symbol(sym.TK_OPLOG, yycolumn + 1, yyline + 1); }
	{TK_OPMAT}                        {return new Symbol(sym.TK_OPMAT, yycolumn + 1, yyline + 1); }
	{TK_OPREL}                        {return new Symbol(sym.TK_OPREL, yycolumn + 1, yyline + 1); }
	{TK_PLUSPLUS}                     {return new Symbol(sym.TK_PLUSPLUS, yycolumn + 1, yyline + 1); }
	{TK_MINUSMINUS}                   {return new Symbol(sym.TK_MINUSMINUS, yycolumn + 1, yyline + 1); }
        {TK_ADDLESS}                      {return new Symbol(sym.TK_ADDLESS, yycolumn + 1, yyline + 1); }

 	/* numeric literals */
	{ENDLINE}                         {}
	{WHITESPACE}                      {}
	{COMMENT_BEGIN}                   {yybegin(COMMENT);}
	{INT} 				  {return new Symbol(sym.INT, yycolumn + 1, yyline + 1, yytext()); }
        {STRING}                          {return new Symbol(sym.STRING, yycolumn + 1, yyline + 1, yytext()); }
	{ID}                              {return new Symbol(sym.ID, yycolumn + 1, yyline + 1, yytext()); }	
	.                                 {throw new RuntimeException("Token desconocido: " +yytext()+" . Linea: "+(yyline + 1)+", columna: "+(yycolumn + 1)); }
}

<COMMENT>{
    {COMMENT_END}                         {yybegin(YYINITIAL);}
    {COMMENT_BEGIN}                       {/*ignorar*/}
    .                                     {/*ignorar*/}
}