	.data
	.align 0
dig_str:.asciiz "Digite o numero: "
inv_str:.asciiz "O num invertido e :"

	.text
	
	li, $v0, 4
	la $a0, dig_str
	syscall
	
	li $v0, 5
	syscall
	
	#$t0 -- resto
	#$t1 -- num invertido
	#$t2 -- condicao de parada
	#$t3 -- auxiliar
	
	li $t1, 0
	li $t2, 10
	
loop: 	
	div $v0, $v0, $t2		# divide por 10 para pegar o resto
	mfhi $t0			# recupera o resto da divisao
	mul $t1, $t1, $t2		# multiplica o novo valor por 10
	add $t1, $t1, $t0		#soma o resto
	beq $v0, $zero, fimloop
	j loop
	
fimloop:
	add $a0, $t1, $zero		
	
	li $v0, 1
	syscall
	li $v0, 10
	syscall
