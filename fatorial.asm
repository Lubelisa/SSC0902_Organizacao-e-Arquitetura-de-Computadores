	.data
	.align 0
digfat_str:.asciiz "Digite o numero: "
fat_str:.asciiz "O fatorial e: "


	.text
	.globl main
	
main:
	li $v0, 4
	la $a0, digfat_str
	syscall
	
	li $v0, 5
	syscall
	
	beq $v0, $zero, zero
	
	move $t0, $v0
	addi $t1, $t0, -1
loop:	
	beq $t1, $zero, fimloop
	mul $t0, $t0, $t1 		# n * fatorial(n-1) --> a condicao de parada e n($t1) = 0
	addi $t1, $t1, -1
	j loop
	
zero:
	li $t0, 1
fimloop:
	li $v0, 4
	la $a0, fat_str
	syscall
	
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	
	li $v0, 10
	syscall
