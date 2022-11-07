.data               # Put Global Data here

.text				# Put program here 
.globl main			# globally define 'main' 

main: 

add $t0, $zero, $zero

addi $t1, $zero, 6     	# t1= 6, display 4, 6

addi $t2, $zero 10     	# t2 = 10, display 8, 10

add $t3, $zero, $t1

sw   $t1, 0($t0)	  		# display 12, (no register written)

sw   $t2, 4($t0)			# display 16, 

lw    $s0, 0($t0)		# s0 = 6, display 20, 6

lw   $s1, 4($t0)			# s1 = 10, display 

bne $t0, $t3, L1

addi $t2, $zero, 12

lw $s2, 2($t0)

blez $t0, L1

addi $t4, $zero, 4

L1:
	
	lw $s3, 2($t0)

	bgtz $t0, L2

	add $t4, $s0, $s1

	lw $s4, 4($t4)

	bltz $t4, L2

	addi $t5, $zero, 8

L2:	

	addi $t0, $zero, 1

	lw $s5, 4($t0)

	blez $t0, L3


	syscall

.end
	
