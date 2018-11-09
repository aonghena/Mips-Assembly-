
#Alex Onghena
#Meghana Reddy
#Yanliang Dong

.text
.globl main

main:
# Display primpt1
li $v0, 4
la $a0, prompt1
syscall

li $v0, 5 # read keyboard into $v0 (number x is number to test)
syscall

move $t0,$v0 # move the first number from $v0 in $t0

# Display the prmopt2 (string)
li $v0, 4
la $a0, prompt2
syscall

# read keyboard into $v0 
li $v0, 5 
syscall

# move the second number from $v0 in $t1
move $t1,$v0 

li $t9, 1 #mask
li $t8, 0 #high
li $t7, 0 #low

#L2 is called when mask is empty completing the loop in any system
L1: beq $t9, $s0, L2
	and $t3 ,$t1, $t9
	beq $t3, $s0, L3
	addu $t8, $t8, $t0
	L3:
	and $t4 ,$t8, 1
	srl $t7, $t7, 1
	srl $t8, $t8, 1
	beq $t4, 0, L5
	add $t7, $t7, 0x80000000
	L5:
	sll $t9, $t9, 1
	j L1

L2:


# print answer 

li $v0, 4 
la $a0, answer
syscall

# print integer function call 1 
# put the answer into $a0
li $v0, 1 
move $a0, $t8
syscall

li $v0, 4 
la $a0, space
syscall

li $v0, 1 
move $a0, $t7
syscall

#exit
end: li $v0, 10 
syscall 
 
.data
prompt1:
 .asciiz "Enter the first number "
prompt2:
 .asciiz "Enter the second number "
answer:
 .asciiz "The output number is "
 
 space:
 .asciiz " "
