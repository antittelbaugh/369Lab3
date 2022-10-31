.data               # Put Global Data here

.text				# Put program here 
.globl main			# globally define 'main' 

main: 
	
	add $t1, $zero, $zero #0
	nop
	nop
	nop
	nop
	nop
	bltz $t1, L1 #no branch, if t1<0, take branch
	nop
	nop
	nop
	nop
	nop
	addi $t1, $t1, 5 #t1=5
	nop
	nop
	nop
	nop
	nop
	L1:
	addi $t1, $t1, 1 #t1=6
	nop
	nop
	nop
	nop
	nop
	add $t2, $zero, $zero #t2=0
	nop
	nop
	nop
	nop
	nop
	addi $t2, $t2, -4 #t2=-4
	nop
	nop
	nop
	nop
	nop
	bltz $t2, L2 #take branch - if t2<0 (-4)
	nop
	nop
	nop
	nop
	nop
	addi $t2, $t2, 4 #skip
	nop
	nop
	nop
	nop
	nop
	L2:
	addi $t2, $t2, 8 #t2=4 NOT 8

	nop
	nop
	nop
	nop
	nop
	
	bgez $t2, L3 #if t2>=0 take branch , yes take
	nop
	nop
	nop
	nop
	nop
	addi $t2, $t2, 2 #don't execute
	nop
	nop
	nop
	nop
	nop
	L3:
	addi $t2, $t2, -4 #t2 = 0
	nop
	nop
	nop
	nop
	nop
	bgez $t2, L4 #take branch
	nop
	nop
	nop
	nop
	nop
	addi $t2, $t2, 2 #don't execute
	nop
	nop
	nop
	nop
	nop
	L4:
	addi $t2, $t2, -4 #t2 = -4
	nop
	nop
	nop
	nop
	nop

	bgez $t2, L5 # do not take branch
	nop
	nop
	nop
	nop
	nop
	addi $t2, $t2, 2 #t2 = -2
	nop
	nop
	nop
	nop
	nop
	L5:
	addi $t2, $t2, 4 #t2 = 2
	


syscall			# this ends execution 

.end
