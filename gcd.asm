# S24 CS 64 
# Lab 04
# gcd.asm 

##### C++ (NON-RECURSIVE) code snippet of gcd(a,b):
    # int main()
    # {
    #     int a, b, n;
    #     int gcd = 1;

    #     cout << "Enter the first number:\n"; 
    #     cin >> a;
    #     cout << "Enter the second number:\n"; 
    #     cin >> b;
        
    #     if(a<b)
    #     {    n = a; }
    #     else
    #     {    n = b; }

    #     for(int i = 1; i <= n; i++)
    #     {
    #         if(a%i==0 && b%i==0)
    #             gcd = i;
    #     }

    #     cout << "GCD: " << gcd <<  "\n"; 

    #     return 0;
    # }


##### Assembly (NON-RECURSIVE) code version of gcd(a,b):

.data

	# TODO: Complete these declarations/initializations
    first_prompt:   .asciiz "Enter the first number:\n"
    second_prompt:  .asciiz "Enter the second number:\n"
    gcd_prompt:     .asciiz "GCD:\n"
    newline:        .asciiz "\n"

.text
main:
    #print first_prompt
    li $v0 4
    la $a0 first_prompt
    syscall

    #read in a
    li $v0 5
    syscall
    move $t0 $v0

    #print second_prompt
    li $v0 4
    la $a0 second_prompt
    syscall

    #read in b
    li $v0 5
    syscall
    move $t1 $v0

    #declare gcd
    li $t2 1

    #declare i for loop
    li $s0 1

    #branch: a<b
    bgt $t0 $t1 branchAlessB
    
    #branch: else
    move $t3 $t1

    j loop

branchAlessB:
    move $t3 $t0

# t0:a t1:b t2:gcd t3:n t4: remainder s0:i

loop:
    beq $s0 $t3 print
    div $t0 $s0
    mfhi $t4
    beq $t4 $zero check_b_remainder
    addi $s0 1
    j loop

check_b_remainder:
    div $t1 $s0
    mfhi $t4
    beq $t4 $zero isGCD
    addi $s0 1
    j loop

isGCD:
    move $t2 $s0
    addi $s0 1
    j loop

print:
    #print gcd_prompt
    li $v0 4
    la $a0 gcd_prompt
    syscall
    
    #print newline
    li $v0 4
    la $a0 newline
    syscall
    
    #print gcd
    li $v0 1
    move $a0 $t2
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
