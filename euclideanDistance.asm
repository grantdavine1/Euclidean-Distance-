.data

	float:		.float 0.0
	
	intpr1:		.asciiz "Enter value of X1: "
	intpr2:		.asciiz "Enter value of X2: "
	intpr3:		.asciiz "Enter value of Y1: "
	intpr4:		.asciiz "Enter value of Y2: "
	space:		.asciiz "\n"
.text 

sqrt:
	# $f2 = 0.0 to be used as $0 in add.s instructions
	lwc1  $f2, float
	
	# Print "Enter value of X1: "
	li $v0, 4
	la $a0, intpr1
	syscall
	
	# Take Value of X! into $f4
	li $v0, 6
	syscall
	mov.s $f4, $f0
	
	# Print "Enter value of X2: "
	li $v0, 4
	la $a0, intpr2
	syscall
	
	# Take Value of X2 into $f6
	li $v0, 6
	syscall
	mov.s $f6, $f0
	
	# Print "Enter value of Y1: "
	li $v0, 4
	la $a0, intpr3
	syscall
	
	# Take Value of Y1 into $f8
	li $v0, 6
	syscall
	mov.s $f8, $f0
	
	# Print "Enter value of Y2: "
	li $v0, 4
	la $a0, intpr4
	syscall
	
	# Take Value of Y2 into $f10
	li $v0, 6
	syscall
	mov.s $f10, $f0
	

	# X1 - Y1 squared 
	sub.s $f14, $f4, $f8
	mul.s $f16, $f14, $f14
	
	# X2 - Y2 squared 
	sub.s $f18, $f6, $f10
	mul.s $f20, $f18, $f18
	
	# (X1 - Y1)^2 + (X2 - Y2)^2
	add.s $f12, $f20, $f16
		
	# The square root of ((X1 - Y1)^2 + (X2 - Y2)^2)
	li $v0, 2
	sqrt.s $f24, $f12
	add.s $f12, $f24, $f2
	syscall
	
	# Blank space
	li $v0, 4
	la $a0, space
	syscall	
	
	j sqrt
	
