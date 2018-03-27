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
        {TK_COMILLA}                      {return new Symbol(sym.TK_COMILLA, yycolumn, yyline); }
        {TK_ELSEIF}                       {return new Symbol(sym.TK_ELSEIF, yycolumn, yyline); }
        {PLUS}                            {return new Symbol(sym.PLUS, yycolumn, yyline); }
        {MINUS}                           {return new Symbol(sym.MINUS, yycolumn, yyline); }
        {OPREL_NOT}                       {return new Symbol(sym.OPREL_NOT, yycolumn, yyline); }
        {BOOLEAN}                         {return new Symbol(sym.BOOLEAN, yycolumn, yyline); }
        {OR}                              {return new Symbol(sym.OR, yycolumn, yyline); }
        {AND}                             {return new Symbol(sym.AND, yycolumn, yyline); }
        {TK_START}                        {return new Symbol(sym.TK_START, yycolumn, yyline); }
        {TK_END}                          {return new Symbol(sym.TK_END, yycolumn, yyline); }
        {LETRA}                           {return new Symbol(sym.LETRA, yycolumn, yyline); }
        {DIGIT}                           {return new Symbol(sym.DIGIT, yycolumn, yyline); }
        {CHAR}                            {return new Symbol(sym.CHAR, yycolumn, yyline); }
        {TK_ARRAY}                        {return new Symbol(sym.TK_ARRAY, yycolumn, yyline); }
	{TK_VARIABLE_TIPO}                {return new Symbol(sym.TK_VARIABLE_TIPO, yycolumn, yyline); }
	{TK_BOOLEAN}                      {return new Symbol(sym.TK_BOOLEAN, yycolumn, yyline); }
	{TK_BREAK}                        {return new Symbol(sym.TK_BREAK, yycolumn, yyline); }
	{TK_CASE}                         {return new Symbol(sym.TK_CASE, yycolumn, yyline); }
	{TK_CHAR}                         {return new Symbol(sym.TK_CHAR, yycolumn, yyline); }
	{TK_STRING}                       {return new Symbol(sym.TK_STRING, yycolumn, yyline); }
	{TK_FUNC}                         {return new Symbol(sym.TK_FUNC, yycolumn, yyline); }
	{TK_ELSE}                         {return new Symbol(sym.TK_ELSE, yycolumn, yyline); }
	{TK_FOR}                          {return new Symbol(sym.TK_FOR, yycolumn, yyline); }
	{TK_DEFAULT}                      {return new Symbol(sym.TK_DEFAULT, yycolumn, yyline); }
	{TK_INT}                          {return new Symbol(sym.TK_INT, yycolumn, yyline); }
	{TK_IF}                           {return new Symbol(sym.TK_IF, yycolumn, yyline); }
	{TK_THEN}                         {return new Symbol(sym.TK_THEN, yycolumn, yyline); }
	{TK_SWITCH}                       {return new Symbol(sym.TK_SWITCH, yycolumn, yyline); }
	{TK_RETURN}                       {return new Symbol(sym.TK_RETURN, yycolumn, yyline); }
	{TK_WHILE}                        {return new Symbol(sym.TK_WHILE, yycolumn, yyline); }
	{TK_PRINT}			  {return new Symbol(sym.TK_PRINT, yycolumn, yyline); }
        {TK_INPUT}			  {return new Symbol(sym.TK_INPUT, yycolumn, yyline); }
        
	/* boolean literals */
	{TK_TRUE}                         {return new Symbol(sym.TK_TRUE, yycolumn, yyline); }
	{TK_FALSE}                        {return new Symbol(sym.TK_FALSE, yycolumn, yyline); }

	/* null literal */
	{TK_NULL}                         {return new Symbol(sym.TK_NULL, yycolumn, yyline); }


	/* separators */
	{TK_LPAREN}                       {return new Symbol(sym.TK_LPAREN, yycolumn, yyline); }
	{TK_RPAREN}                       {return new Symbol(sym.TK_RPAREN, yycolumn, yyline); }
	{TK_LBRACE}                       {return new Symbol(sym.TK_LBRACE, yycolumn, yyline); }
	{TK_RBRACE}                       {return new Symbol(sym.TK_RBRACE, yycolumn, yyline); }
	{TK_LBRACK}                       {return new Symbol(sym.TK_LBRACK, yycolumn, yyline); }
	{TK_RBRACK}                       {return new Symbol(sym.TK_RBRACK, yycolumn, yyline); }
	{TK_SEMICOLON}                    {return new Symbol(sym.TK_SEMICOLON, yycolumn, yyline); }
	{TK_COMMA}                        {return new Symbol(sym.TK_COMMA, yycolumn, yyline); }
	{TK_DOT}                          {return new Symbol(sym.TK_DOT, yycolumn, yyline); }

	/* operators */
	{TK_ASIG}                         {return new Symbol(sym.TK_ASIG, yycolumn, yyline); }
	{TK_OPLOG}                        {return new Symbol(sym.TK_OPLOG, yycolumn, yyline); }
	{TK_OPMAT}                        {return new Symbol(sym.TK_OPMAT, yycolumn, yyline); }
	{TK_OPREL}                        {return new Symbol(sym.TK_OPREL, yycolumn, yyline); }
	{TK_PLUSPLUS}                     {return new Symbol(sym.TK_PLUSPLUS, yycolumn, yyline); }
	{TK_MINUSMINUS}                   {return new Symbol(sym.TK_MINUSMINUS, yycolumn, yyline); }
        {TK_ADDLESS}                      {return new Symbol(sym.TK_ADDLESS, yycolumn, yyline); }

 	/* numeric literals */
	{ENDLINE}                         {}
	{WHITESPACE}                      {}
	{COMMENT_BEGIN}                   {yybegin(COMMENT);}
	{INT} 				  {return new Symbol(sym.INT, yycolumn, yyline, yytext()); }
        {STRING}                          {return new Symbol(sym.STRING, yycolumn, yyline, yytext()); }
	{ID}                              {return new Symbol(sym.ID, yycolumn, yyline, yytext()); }	
	.                                 {throw new RuntimeException("Token desconocido: " +yytext()+" . Linea: "+(yyline)+", columna: "+(yycolumn)); }
}

<COMMENT>{
    {COMMENT_END}                         {yybegin(YYINITIAL);}
    {COMMENT_BEGIN}                       {/*ignorar*/}
    .                                     {/*ignorar*/}
}