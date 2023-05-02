NOME = teste_da_biblioteca

all: $(NOME).o
	ld -s -o $(NOME) $(NOME).o
	rm -rf *.o;

%.o: %.asm
	nasm -f elf64 $<