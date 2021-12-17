# A Linguagem C- (v1.1 - 2021.2)

## Aspectos Léxicos

1. Palavras-chave (_keywords_)

```
const  else for if  int return  void  while
```
As palavras-chave são reservadas e devem ser escritas em letras minúsculas.

2. Símbolos especiais

```
  +  -  *  /  =  <  <=  >  >=  ==  !=   ;  ,  (  )  [  ]  {  } 
```

 3. ID (identificadores) e NUM (números inteiros)

```
  ID = letter ( letter | digit | _)*

  NUM = digit digit*

  letter = a | .. | z | A | .. | Z

  digit = 0 | .. | 9
```

Caracteres minúsculos e maiúsculos são diferenciados.

4. Caracteres de espacejamento (_white space_) incluem _blanks_ (' '), _newlines_ ('\n'), e _tabs_ ('\t'). Tais caracteres devem ser ignorados exceto quando separam  ID, NUM e palavras-chave.

5. Comentários

- Comentários de uma linha (_single-line comments_) sempre são iniciados por "//".  Comentários de uma linha não podem se estender por mais de uma linha e não podem ser aninhados.

6. Erros Léxicos para C-v1.1

+ Erros léxicos em programas C-v1.1 que devem ser reportados:
  + Caracter desconhecido, por exemplo, "?".

+ Erros léxicos em programas C-v1.1 que __não__ devem ser reportados:
  + ID malformado, por exemplo, "0a" não será tratado como erro léxico; o analisador léxico deverá retornar, separadamente, "NUM" 0 e "ID" a.
  
+ A análise léxica de programas C-v1.1 __não__ deve dar suporte a: 
  + ID malformado, por exemplo, "0a" não será tratado como erro léxico; o analisador léxico deverá retornar, separadamente, "NUM" 0 e "ID" a.
  + Construções e funcionalidades que não estão na especificação da linguagem e do trabalho T1.

