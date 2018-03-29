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


CHAR = \'[a-zA-Z]\'
STRING = \".*\"
LETRA = [a-zA-Z]
INT = [0-9]+
ID = {LETRA}({LETRA}|[0-9])*

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
TK_RETURN = return

//If Else
TK_IF = if
TK_THEN = then
TK_ELSE = else
TK_ELSEIF = elseif

//While Case
TK_WHILE = while

BOOLEAN = true|false
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
GT = ">"
LT = "<"
EQEQ = "=="
LTEQ = "<="
GTEQ = ">="
NOTEQ = "!="
TK_OPLOG = {GT} | {LT} | {EQEQ} | {LTEQ} | {GTEQ} | {NOTEQ}

TK_ADDLESS = \++|--

PLUS = \+
MINUS = -
MULT = \*
DIV = \/
MOD = %
TK_OPMAT = {MULT} | {DIV} | {MOD}

AND = "&&"
OR = "||"
TK_OPREL = {AND} | {OR}

OPREL_NOT = \!


COMMENT_BEGIN = [/**]
COMMENT_END = [**/]

%state COMMENT

%%

<YYINITIAL>{
        {TK_ELSEIF}                       {return new Symbol(sym.TK_ELSEIF, yycolumn + 1, yyline + 1, yytext()); }
        {PLUS}                            {return new Symbol(sym.PLUS, yycolumn + 1, yyline + 1, yytext()); }
        {MINUS}                           {return new Symbol(sym.MINUS, yycolumn + 1, yyline + 1, yytext()); }
        {OPREL_NOT}                       {return new Symbol(sym.OPREL_NOT, yycolumn + 1, yyline + 1, yytext()); }
        {BOOLEAN}                         {return new Symbol(sym.BOOLEAN, yycolumn + 1, yyline + 1, yytext()); }
        {OR}                              {return new Symbol(sym.OR, yycolumn + 1, yyline + 1, yytext()); }
        {AND}                             {return new Symbol(sym.AND, yycolumn + 1, yyline + 1, yytext()); }
        {TK_START}                        {return new Symbol(sym.TK_START, yycolumn + 1, yyline + 1, yytext()); }
        {TK_END}                          {return new Symbol(sym.TK_END, yycolumn + 1, yyline + 1, yytext()); }
        {CHAR}                            {return new Symbol(sym.CHAR, yycolumn + 1, yyline + 1, yytext()); }
        {TK_ARRAY}                        {return new Symbol(sym.TK_ARRAY, yycolumn + 1, yyline + 1, yytext()); }
	{TK_VARIABLE_TIPO}                {return new Symbol(sym.TK_VARIABLE_TIPO, yycolumn + 1, yyline + 1, yytext()); }
	{TK_BOOLEAN}                      {return new Symbol(sym.TK_BOOLEAN, yycolumn + 1, yyline + 1, yytext()); }
	{TK_BREAK}                        {return new Symbol(sym.TK_BREAK, yycolumn + 1, yyline + 1, yytext()); }
	{TK_CASE}                         {return new Symbol(sym.TK_CASE, yycolumn + 1, yyline + 1, yytext()); }
	{TK_CHAR}                         {return new Symbol(sym.TK_CHAR, yycolumn + 1, yyline + 1, yytext()); }
	{TK_STRING}                       {return new Symbol(sym.TK_STRING, yycolumn + 1, yyline + 1, yytext()); }
	{TK_FUNC}                         {return new Symbol(sym.TK_FUNC, yycolumn + 1, yyline + 1, yytext()); }
	{TK_ELSE}                         {return new Symbol(sym.TK_ELSE, yycolumn + 1, yyline + 1, yytext()); }
	{TK_FOR}                          {return new Symbol(sym.TK_FOR, yycolumn + 1, yyline + 1, yytext()); }
	{TK_DEFAULT}                      {return new Symbol(sym.TK_DEFAULT, yycolumn + 1, yyline + 1, yytext()); }
	{TK_INT}                          {return new Symbol(sym.TK_INT, yycolumn + 1, yyline + 1, yytext()); }
	{TK_IF}                           {return new Symbol(sym.TK_IF, yycolumn + 1, yyline + 1, yytext()); }
	{TK_THEN}                         {return new Symbol(sym.TK_THEN, yycolumn + 1, yyline + 1, yytext()); }
	{TK_SWITCH}                       {return new Symbol(sym.TK_SWITCH, yycolumn + 1, yyline + 1, yytext()); }
	{TK_RETURN}                       {return new Symbol(sym.TK_RETURN, yycolumn + 1, yyline + 1, yytext()); }
	{TK_WHILE}                        {return new Symbol(sym.TK_WHILE, yycolumn + 1, yyline + 1, yytext()); }
	{TK_PRINT}			  {return new Symbol(sym.TK_PRINT, yycolumn + 1, yyline + 1, yytext()); }
        {TK_INPUT}			  {return new Symbol(sym.TK_INPUT, yycolumn + 1, yyline + 1, yytext()); }
        
	/* null literal */
	{TK_NULL}                         {return new Symbol(sym.TK_NULL, yycolumn + 1, yyline + 1, yytext()); }


	/* separators */
	{TK_LPAREN}                       {return new Symbol(sym.TK_LPAREN, yycolumn + 1, yyline + 1, yytext()); }
	{TK_RPAREN}                       {return new Symbol(sym.TK_RPAREN, yycolumn + 1, yyline + 1, yytext()); }
	{TK_LBRACE}                       {return new Symbol(sym.TK_LBRACE, yycolumn + 1, yyline + 1, yytext()); }
	{TK_RBRACE}                       {return new Symbol(sym.TK_RBRACE, yycolumn + 1, yyline + 1, yytext()); }
	{TK_LBRACK}                       {return new Symbol(sym.TK_LBRACK, yycolumn + 1, yyline + 1, yytext()); }
	{TK_RBRACK}                       {return new Symbol(sym.TK_RBRACK, yycolumn + 1, yyline + 1, yytext()); }
	{TK_SEMICOLON}                    {return new Symbol(sym.TK_SEMICOLON, yycolumn + 1, yyline + 1, yytext()); }
	{TK_COMMA}                        {return new Symbol(sym.TK_COMMA, yycolumn + 1, yyline + 1, yytext()); }
	{TK_DOT}                          {return new Symbol(sym.TK_DOT, yycolumn + 1, yyline + 1, yytext()); }

	/* operators */
	{TK_ASIG}                         {return new Symbol(sym.TK_ASIG, yycolumn + 1, yyline + 1, yytext()); }
	{TK_OPLOG}                        {return new Symbol(sym.TK_OPLOG, yycolumn + 1, yyline + 1, yytext()); }
	{TK_OPMAT}                        {return new Symbol(sym.TK_OPMAT, yycolumn + 1, yyline + 1, yytext()); }
	{TK_OPREL}                        {return new Symbol(sym.TK_OPREL, yycolumn + 1, yyline + 1, yytext()); }
	{TK_ADDLESS}                      {return new Symbol(sym.TK_ADDLESS, yycolumn + 1, yyline + 1, yytext()); }

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