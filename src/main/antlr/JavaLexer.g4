lexer grammar JavaLexer;

// Whitespace
NEWLINE            : ('\r\n' | 'r' | '\n') -> skip ;
WS                 : [\t ]+ -> skip ;

// Keywords
INTERFACE          : 'interface' ;
CLASS              : 'class' ;

// Literals

// Operators

// Identifiers
ID                 : [A-Za-z0-9_]+ ;

// Misc
LBRACKET           : '{' ;
RBRACKET           : '}' ;
