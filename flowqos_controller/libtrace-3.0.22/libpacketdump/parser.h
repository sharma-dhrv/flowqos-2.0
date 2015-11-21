/* A Bison parser, made by GNU Bison 2.5.  */

/* Bison interface for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2011 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     TOK_BIGENDIAN = 258,
     TOK_LITTLEENDIAN = 259,
     TOK_NEXT = 260,
     TOK_OUTPUT_INT = 261,
     TOK_OUTPUT_HEX = 262,
     TOK_OUTPUT_IPV4 = 263,
     TOK_OUTPUT_FLAG = 264,
     TOK_CONSTANT = 265,
     TOK_IDENTIFIER = 266,
     TOK_OUTPUT_MAC = 267,
     TOK_OUTPUT_NONE = 268
   };
#endif
/* Tokens.  */
#define TOK_BIGENDIAN 258
#define TOK_LITTLEENDIAN 259
#define TOK_NEXT 260
#define TOK_OUTPUT_INT 261
#define TOK_OUTPUT_HEX 262
#define TOK_OUTPUT_IPV4 263
#define TOK_OUTPUT_FLAG 264
#define TOK_CONSTANT 265
#define TOK_IDENTIFIER 266
#define TOK_OUTPUT_MAC 267
#define TOK_OUTPUT_NONE 268




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 2068 of yacc.c  */
#line 24 "parser.y"

    int intval;
    char *textval;
    element_t *ptr;



/* Line 2068 of yacc.c  */
#line 84 "parser.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


