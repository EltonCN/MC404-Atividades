#Liga os arquivos no programa
prog.x: main.o log.o math.o
	ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 /usr/lib64/crt1.o /usr/lib64/crti.o -L/usr/lib64 main.o math.o log.o -lc /usr/lib64/crtn.o -o prog.x

#Compila e monta o arquivo main
main.s: main.c
	gcc -S main.c -o main.s

main.o: main.s
	as main.s -o main.o

#Compila e monta o arquivo math
math.s: math.c
	gcc -S math.c -o math.s

math.o: math.s
	as math.s -o math.o

#Compila e monta o arquivo log
log.s: log.c
	gcc -S log.c -o log.s

log.o: log.s
	as log.s -o log.o

#Limpa os arquivos
clean:
	rm -f main.s math.s log.s main.o math.o log.o prog.x 