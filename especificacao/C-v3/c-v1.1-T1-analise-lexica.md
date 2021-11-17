# Projeto de um Compilador
  
## Parte I: Análise Léxica

Nesta parte do projeto, você irá implementar um analisador léxico para a [linguagem C- v1.1](./C-V1.1.md).
O analisador léxico ou _scanner_ deve ler um programa fonte e produzir uma lista de _tokens_, 
sequencialmente, um _token_ de cada vez, anotado com as seguintes informações: 
sua localização no código fonte (linha), tipo do _token_ (ID, NUM, etc) e seu lexema ("main", "123", etc.).
Se uma entrada inválida for encontrada, ele deve informar _ERROR_, anotado também com a linha e com o lexema incorreto.

Antes de iniciar a sua implementação, recomendamos que leia com atenção o [capítulo 3](../../resources/20-chapter3.pdf) 
do livro "Introduction to Compilers and Language Design" de Douglas Thain. 
Apesar da sintaxe de C-v1.1 ser um pouco diferente da usada nesse livro, os exemplos de código e o material podem ser extremamente úteis.

Para conhecer Flex, pode utilizar texto Flex in a Nutshell, na página da disciplina.

## Classes de _tokens_

Em sua implementação do analisador léxico, considere as seguintes classes de _tokens_ da linguagem:

__ID__      Identificador

__NUM__     Literal decimal (integer)

__KEY__     Keyword (palavra-chave)

__SYM__     Símbolo Léxico

__ERROR__   Lexema do primeiro erro encontrado

Comentários e caracteres de espacejamento (_white space_) devem ser descartados durante a fase de análise léxica do compilador. 
Você deve imprimir o número da linha na qual o _token_ foi encontrado, inclusive no caso de erro. 
O analisador léxico não deve parar após encontrar o primeiro erro léxico.
No caso de erro, retornar o _token_ __ERROR__.
O formato de saída é:

``` (line_num,token_class,"lexeme") ```

## Exemplo de arquivo de entrada em C-v1.1 (main.c)
```
void main(void)
{
  int a;
  a = 4 + 5;
}
```

## Como executar (dois argumentos: entrada e saída)
Seu programa deve ler um arquivo-fonte (_source_), com extensão ".c", da entrada padrão
e escrever em outro arquivo (_target_), com extensão ".out", na saída padrão.

```
$ ./c-v1.1 < main.c > main.out
```

## Modelo de arquivo de saída gerado pelo analisador léxico
Após a execução de ./c-v1.1, tendo como entrada o arquivo main.c (contendo um programa C-v1.1), 
a saída gerada no arquivo main.out deverá ser:
```
(1,KEY,"void")
(1,ID,"main")
(1,SYM,"(")
(1,KEY,"void")
(1,SYM,")")
(2,SYM,"{")
(3,KEY,"int")
(3,ID,"a")
(3,SYM,";")
(4,ID,"a")
(4,SYM,"=")
(4,NUM,"4")
(4,SYM,"+")
(4,NUM,"5")
(4,SYM,";")
(5,SYM,"}")
```

## Scripts
Observar que há dois arquivos na pasta: __compile.sh__ e __run.sh__ para compilar e executar o seu código:

+ __compile.sh__ (usa a ferramenta Flex com seu arquivo, obrigatoriamente chamado de c-v1.1.l)
```
flex c-v1.1.l  // colocar seu código FLEX em arquivo com nome "c-v1.1.l"
cc -o c-v1.1 lex.yy.c -ll  // compilar lex.yy.c e gerar o código objeto com nome "c-v1.1"
```
+ __run.sh__ (recebe dois argumentos, sendo o primeiro o nome do arquivo de entrada (código C-v1.1) 
e o segundo o nome do arquivo de saída (com extensão .out)
```
./c-v1.1 < $1 > $2  // executa o analisador léxico com entrada lida de $1 e saída escrita em $2
```

__Observação Importante sobre__ ___Line Endings___: 
Arquivos de texto criados com DOS/Windows machines usam _carriage return_ _line feed_ ("\r\n") para terminar uma linha, 
enquando que os criados com Unix usam apenas o _line feed_ ("\n").

## Desenvolvimento no GitHub

A atribuição do trabalho prático 1 (TP1), com data de entrega serão realizadas no Classroom da turma.



