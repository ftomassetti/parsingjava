parser grammar JavaParser;

options { tokenVocab=JavaLexer; }

javaFile : topLevelElements+=topLevelElement EOF
         ;

topLevelElement : typeDeclaration
                ;

//
// Basic
//

qualifiedID : (qualifiers+=ID DOT)* name=ID ;

//
// Top level declarations
//

typeDeclaration : interfaceDeclaration
                | classDeclaration
                ;

interfaceDeclaration : INTERFACE name=ID LBRACKET RBRACKET ;

classDeclaration : CLASS name=ID LBRACKET (elements+=classElement)* RBRACKET ;

classElement : fieldDeclaration
             | classMethodDeclaration
             | SEMICOLON
             ;

fieldDeclaration : type name=ID (ASSIGN value=expression)? SEMICOLON;

classMethodDeclaration : returnType=type name=ID LPAREN (params+=param (COMMA params+=param)*)? RPAREN LBRACKET (statements+=statement)* RBRACKET ;

param : type name=ID ;

//
// Types
//

type : PRIMITIVE_TYPE #primitiveType
     | VOID #voidType
     | name=qualifiedID #referenceType;

//
// Expressions
//

expression : (TRUE | FALSE) #booleanLiteral
           | name=ID #reference;

//
// Statements
//

statement : RETURN (value=expression)? SEMICOLON #returnStatement;
