.data               # Put Global Data here

.text				# Put program here 
.globl main			# globally define 'main' 

main: 
    add $t0, $zero, $zero # t0=0, display 0, 0    
    nop
    nop
    nop
    nop
    nop

    addi $t1, $zero, 6 # t1= 6, display 24, 6

    nop
    nop
    nop
    nop
    nop

    addi $t2, $zero, 10 # t2 = 10, display 48, 10

    nop
    nop
    nop
    nop
    nop

    sw $t1, 0($t0) # display 72, (no register written)

    nop
    nop
    nop
    nop
    nop

    sw $t2, 4($t0) # display 96

    nop
    nop
    nop
    nop
    nop

    lw $s0, 0($t0) # s0 = 6, display 120, 6

    nop
    nop
    nop
    nop
    nop

    lw $s1, 4($t0) # s1 = 10, display 144, 10

    nop
    nop
    nop
    nop
    nop

    sub $t3, $s1, $s0 # t3 = 10-6 = 4, display 168, 4

    nop
    nop
    nop
    nop
    nop

    sll $t4, $t3, 3 # t4 = 4 << 3 = 64, display 192, 64

    nop
    nop
    nop
    nop
    nop

    srl $t5, $t4, 2 # t5 = 16 64 >> 2, display 216, 16

    nop
    nop
    nop
    nop
    nop

    add $t5, $t4, $t5 #t5 = 16+64, display 240, 80

    nop
    nop
    nop
    nop
    nop

    add $t6, $t1, $t2 # t6 = 16, display 264, 16

    nop
    nop
    nop
    nop
    nop
    
    mul $t7, $t1, $t2 # t7 = 6*10, display 288, 60
    
    nop
    nop
    nop
    nop
    nop

    add $t0, $zero, $zero # t0=0 display 312, 0

    nop
    nop
    nop
    nop
    nop

    addi $t1, $zero, 5 # t0=5, display 336, 5

    nop
    nop
    nop
    nop
    nop

    loop: 
        beq $t1, $t0, L1 # if t1 != t0,else (360)

    nop
    nop
    nop
    nop
    nop

    addi $t0, $t0, 1 # t0+=1  , (384)

    nop
    nop
    nop
    nop
    nop
    
    j loop 

    nop
    nop
    nop
    nop
    nop

    L1: 
        addi $t3, $zero, 3 # t3 = 3, (432)

    nop
    nop
    nop
    nop
    nop

    bgez $t3, L2 # t3 >=0 skip next instruction 

    nop
    nop
    nop
    nop
    nop
    
    addi $t3, $t3, 1 #t3 = 4, (480)

    nop
    nop
    nop
    nop
    nop

    L2: 
        addi $t3, $t3, 5 #$t3 = 8

    nop
    nop
    nop
    nop
    nop

    addi $t2, $t2, 300 #t2=310
    
    nop
    nop
    nop
    nop
    nop

    sw $t3, 0($t0) 

    nop
    nop
    nop
    nop
    nop

    sw $t2, 4($t0)

    nop
    nop
    nop
    nop
    nop

    lb $t4, 0($t0) #t4=8

    nop
    nop
    nop
    nop
    nop

    lb $t5, 4($t0) #t5=54

    nop
    nop
    nop
    nop
    nop

    lw $t5, 4($t0) #t5=310

    nop
    nop
    nop
    nop
    nop

    sb $t5, 0($t0) 

    nop
    nop
    nop
    nop
    nop

    lw $t6, 0($t0) #t6=54

    nop
    nop
    nop
    nop
    nop

    sh $t5, 0($t0)
    
    nop
    nop
    nop
    nop
    nop

    lh $t6, 0($t0) #t6 = 310

    nop
    nop
    nop
    nop
    nop

    addi $t8, $zero, 5 #t8=5

    nop
    nop
    nop
    nop
    nop

    addi $t9, $zero, 11 # t9=11
    
    nop
    nop
    nop
    nop
    nop

    slt $t7, $t8, $t9 #t7=1

    nop
    nop
    nop
    nop
    nop

    blez $t7, L3 #should not skip instruction

    nop
    nop
    nop
    nop
    nop

    addi $t7, $t7, 1 #t7=2

    nop
    nop
    nop
    nop
    nop

    slti $t6, $t7, 4 #t6=1

    nop
    nop
    nop
    nop
    nop

    slti $t6, $t7, 1 #t6=0
    
    nop
    nop
    nop
    nop
    nop

    addi $t6, $zero, 6 #t6=6
    
    nop
    nop
    nop
    nop
    nop

    and $t3, $t6, $t7 # t3=2

    nop
    nop
    nop
    nop
    nop

    or $t3, $t6, $t7 #t3=6

    nop
    nop
    nop
    nop
    nop
        
    xor $t3, $t6, $t7 #t3=4

    nop
    nop
    nop
    nop
    nop

    andi $t3, $t7, 3 #t3=2

    nop
    nop
    nop
    nop
    nop

    ori $t3, $t7, 3 # t3=3
    nop
    nop
    nop
    nop
    nop

    xori $t3, $t7, 3 #t3=1

    nop
    nop
    nop
    nop
    nop

    nor $t3, $t6, $t7 #t3 = 1
    
    nop
    nop
    nop
    nop
    nop

    bgtz $t3, L3 #branch should execute because t3>0
    
    nop
    nop
    nop
    nop
    nop

    addi $t3, $t3, 1 # t3=2 - should not execute

    nop
    nop
    nop
    nop
    nop

    L3: 
        addi $t3, $t3, 2 #t3=3

    nop
    nop
    nop
    nop
    nop

    bltz $t3, L4 # should not take branch t3=3>0

    nop
    nop
    nop
    nop
    nop

    add $t3, $zero, $zero #set t3 to 0

    nop
    nop
    nop
    nop
    nop

    L4: 
        blez $t3, L5 #branch should execute t3=0

    nop
    nop
    nop
    nop
    nop

    addi $t3, $t3, 2 #t3=2 should not execute

    nop
    nop
    nop
    nop
    nop
    L5:

    addi $t3, $t3, 1 #t3=1

    nop
    nop
    nop
    nop
    nop

    jal loop1

    nop
    nop
    nop
    nop
    nop

    addi $t3, $t3, 1 # t3=2

    nop
    nop
    nop
    nop
    nop

    addi $t3, $t3, 1 # t3=3

    nop
    nop
    nop
    nop
    nop

    loop1:  
        jr $ra 

    #syscall			# this ends execution 

.end
