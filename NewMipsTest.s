.data               # Put Global Data here

.text				# Put program here 
.globl main			# globally define 'main' 

main: 

    add      $t0, $zero, $zero 	# t0=0, display 0, 0

    add  $t1, $t0, $zero

	addi $t2, $zero, 6     	# t1= 6, display 4, 6

    addi $t3, $zero, 10     	# t2 = 10, display 8, 10

    add $t4, $t0, $zero   # t3 = 6, dsiplay 12, 6

    add $t6, $t1, $zero

    addi $t3, $zero, 11

    add $t6, $t1, $zero

    add $t4, $t3, $t0
    
    add $t2, $t3, $t1

    lw $s2, 0($t0)

    add $t1, $zero, $t2

    addi $t5, $zero, 7

    addi $t6, $zero, 8

    add $t3, $zero, $t2

    add $t4, $t0, $t6

    addi $t7, $zero, 5

    add $t8, $t4, $t6

    add $t1, $t3, $t5

    add $t9, $t4, $t5

 	sw   $t1, 0($t0)	  		# display 12, (no register written)

    sw   $t2, 4($t0)			# display 16, 

    lw    $s0, 0($t0)		# s0 = 6, display 20, 6

	lw   $s1, 4($t0)			# s1 = 10, display 24, 10

	sub  $t3, $s1, $s0          # t3 = 10-6 = 4, display 28, 4

	sll  $t4, $t3, 3      	# t4 = 4 << 3 = 32     , display 32, 32   
    
	srl  $t5, $t4, 2      	# t5 = 32 >> 2 = 8, display 36, 8     

    add $t5, $t4, $t5 #t5 = 32+8, display 40, 40 (30)

    add $t6, $t1, $t2 # t6 = 16, display 44, 16 (10)

    mul $t7, $t1, $t2 # t7 = 6*10, display 48, 60 (3C)

    addi $t1, $zero, 5 # t0=5, display 56, 5

    add $t0, $zero, $zero # t0=0 display 52, 0

    loop: 
        beq $t1, $t0, L1 # if t1 != t0,else (60)

    addi $t0, $t0, 1 # t0+=1  , (64)

    j loop 

    L1: 
        addi $t3, $zero, 3 # t3 = 3, (72)

        add $t1, $zero, $t3

        add $t0, $zero, $t3

        lw $s3, 2($t0)

        beq $t1, $t0, L2

        add $t3, $zero, $t1

        bgez $t3, L2 # t3 >=0 skip next instruction 
    
        addi $t3, $t3, 1 #t3 = 4, (80) ...should not run

    L2: 
        addi $t3, $t3, 5 #$t3 = 8

        addi $t3, $zero, 8

        addi $t2, $t2, 100 #t2=110
 
        sw $t3, 0($t0) 

        sw $t2, 4($t0)

        lb $t4, 0($t0) #t4=8

        lb $t5, 4($t0) #t5=54

        lw $t5, 4($t0) #t5=110

        bgez $t5, L3

        sb $t5, 0($t0) 

    lw $t6, 0($t0) #t6=54

    sh $t5, 0($t0)

    lh $t6, 0($t0) #t6 = 110

    addi $t8, $zero, 5 #t8=5

    addi $t9, $zero, 11 # t9=11
 
    slt $t7, $t8, $t9 #t7=1

    blez $t7, L3 #should not skip instruction

    addi $t7, $t7, 1 #t7=2

    slti $t6, $t7, 4 #t6=1

    slti $t6, $t7, 1 #t6=0
 
    addi $t6, $zero, 6 #t6=6
 
    and $t3, $t6, $t7 # t3=2

    or $t3, $t6, $t7 #t3=6

    xor $t3, $t6, $t7 #t3=4

    andi $t3, $t7, 3 #t3=2

    ori $t3, $t7, 3 # t3=3

    xori $t3, $t7, 3 #t3=1

    nor $t3, $t6, $t7 #t3 = 1

    addi $t3, $zero, 1

    add $t3, $zero, $t1

    bgtz $t3, L3 #branch should execute because t3>0

    addi $t3, $t3, 1 # t3=2 - should not execute

    L3: 
        addi $t3, $t3, 2 #t3=3

        add $t3, $zero, $t6

    bltz $t3, L4 # should not take branch t3=3>0

    add $t3, $zero, $zero #set t3 to 0

    L4: 
        blez $t3, L5 #branch should execute t3=0

    addi $t3, $t3, 2 #t3=2 should not execute

    L5:

    addi $t3, $t3, 1 #t3=1

        add $t4, $t4, $zero #t4=8
 
        addi $t5, $zero, 5 #t5=5

        bne $t5, $t4, L6 #take branch

        addi$t5,$t5, 1 #t5=6 not executed
 
        L6:
        addi $t5,$t5,2 #t5=7

    jal loop1

    addi $t3, $t3, 1 # t3=2

    addi $t3, $t3, 1 # t3=3

    loop1:  
        jr $ra 



    syscall			# this ends execution 

.end
