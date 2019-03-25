		.data
		.align 0
peso_str: 	.asciiz "Digite o peso: "
altura_str: 	.asciiz "Digite a altura: "
resultado_str: 	.asciiz "O IMC é: "
acimapeso_str: 	.asciiz "\nA pessoa está acima do peso!\n"
abaixopeso_str: .asciiz "\nA pessoa está abaixo do peso!\n"
pesonormal_str:	.asciiz "\nA pessoa está com peso normal!\n"


		.align 3
acimapeso:	.float 26.0
abaixopeso:	.float 17.0


		.text
	
		.globl main

main:
		li $v0, 4		#digite o peso
		la $a0, peso_str
		syscall
		
		li $v0, 6		#le o peso
		syscall
	
		mov.s $f1, $f0		#move o peso recebido para o registrador $f1
	
		li $v0, 4		#digite a altura
		la $a0, altura_str
		syscall
	
		li $v0, 6		#le a altura
		syscall
	
		mov.s $f2, $f0		#move a altura recebida para $f2

		div.s $f12, $f1, $f2	#divide o peso pela altura
		div.s $f12, $f12, $f2	#divide novamente
	
		li $v0, 4		#O resultado é...
		la $a0, resultado_str
		syscall
	
		li $v0, 2		#...e imprime o resultado
		syscall
	
		l.s $f3, abaixopeso	
		c.le.s $f12, $f3
		bc1t abaixo
		l.s $f3, acimapeso
		c.le.s $f12, $f3
		bc1t normal
	
	
	
		li $v0, 4		#acima do peso
		la $a0, acimapeso_str
		syscall
	
		j fim
normal:
		li $v0, 4		
		la $a0, pesonormal_str	#peso normal
		syscall	
	
		j fim
abaixo:
		li $v0, 4		#abaixo do peso
		la $a0, abaixopeso_str
		syscall
fim:
		li $v0, 10
		syscall
