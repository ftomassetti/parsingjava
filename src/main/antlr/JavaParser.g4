parser grammar JavaParser;

options { tokenVocab=JavaLexer; }

javaFile : topLevelElements+=topLevelElement EOF
         ;

topLevelElement : typeDeclaration
                ;

typeDeclaration : interfaceDeclaration
                | classDeclaration
                ;

interfaceDeclaration : INTERFACE name=ID LBRACKET RBRACKET ;

classDeclaration : CLASS name=ID LBRACKET RBRACKET ;
