# Assembly 

## Executando o compilador e linkeditor com um comando

Para executar o compilador asm e o linkeditor com apenas um comando utilizando o [make](https://www.gnu.org/software/make/manual/make.html), você precisa criar um arquivo Makefile com as regras de compilação e linkagem. O make é uma ferramenta que permite automatizar o processo de compilação de um projeto, usando as regras definidas no arquivo Makefile.

Segue um exemplo de Makefile para compilar e linkar um arquivo fonte em Assembly x86-64 para gerar um executável:

```makefile
NOME = nome_do_arquivo_de_codigo_fonte

all: $(NOME).o
	ld -s -o $(NOME) $(NOME).o
	rm -rf *.o;

%.o: %.asm
	nasm -f elf64 $<
```

## Agora só executar este comando toda vez que for buildar

```make
make
```

## Executando programa compilado

```sh
./nome_do_executável
```
