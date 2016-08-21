lexer grammar JavaLexer;

// Whitespace
NEWLINE            : ('\r\n' | 'r' | '\n') -> skip ;
WS                 : [\t ]+ -> skip ;

// Keywords

// Literals

// Operators

// Identifiers
ID                 : [_]*[a-z][A-Za-z0-9_]* ;
