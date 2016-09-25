lexer grammar JavaLexer;

// Whitespace
NEWLINE            : ('\r\n' | 'r' | '\n') -> skip ;
WS                 : [\t ]+ -> skip ;

// Keywords
INTERFACE          : 'interface' ;
CLASS              : 'class' ;
RETURN             : 'return' ;
PRIMITIVE_TYPE     : 'int' | 'byte' | 'short' | 'long' | 'boolean' | 'float' | 'double' | 'char' ;
VOID               : 'void' ;
TRUE               : 'true' ;
FALSE              : 'false' ;

// Literals

// Operators

// Identifiers
ID                 : [A-Za-z0-9_]+ ;

// Misc
LBRACKET           : '{' ;
RBRACKET           : '}' ;
LPAREN             : '(' ;
RPAREN             : ')' ;
ASSIGN             : '=' ;
DOT                : '.' ;
SEMICOLON          : ';' ;
COMMA              : ',' ;
