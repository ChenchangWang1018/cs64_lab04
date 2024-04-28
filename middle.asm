# S24 CS 64 
# Lab 04
# middle.asm 



.data

    # TODO: Complete these declarations/initializations

    first:          .asciiz "Enter the first number:\n"
    second:         .asciiz "Enter the second number:\n"
    third:          .asciiz "Enter the third number:\n"
    middle:         .asciiz "Middle:\n"
    newline:        .asciiz "\n"


.text
main:
    #print first
    li $v0 4
    la $a0 first
    syscall

    #read in first
    li $v0 5
    syscall
    move $t0 $v0

    #print second
    li $v0 4
    la $a0 second
    syscall
    
    #read in second
    li $v0 5
    syscall
    move $t1 $v0

    #print third
    li $v0 4
    la $a0 third
    syscall
    
    #read in third
    li $v0 5
    syscall
    move $t2 $v0

    #a=t0 b=t1 c=t2
cmpab_1:
    bgt $t0 $t1 swapab_1
    j cmpbc

swapab_1:
    move $t4 $t0
    move $t0 $t1
    move $t1 $t4
    j cmpbc

cmpbc:
    bgt $t1 $t2 swapbc
    j cmpab_2

swapbc:
    move $t4 $t1
    move $t1 $t2
    move $t2 $t4
    j cmpab_2

cmpab_2:
    bgt $t0 $t1 swapab_2
    j print

swapab_2:
    move $t4 $t0
    move $t0 $t1
    move $t1 $t4
    j print

print:
    #print middle
    li $v0 4
    la $a0 middle
    syscall
    
    #print mid
    li $v0 1
    move $a0 $t1
    syscall
 
    #print newline
    li $v0 4
    la $a0 newline
    syscall
    
    j exit

exit:
    li $v0 10
    syscall
    # TODO: Write code to properly exit a SPIM simulation
