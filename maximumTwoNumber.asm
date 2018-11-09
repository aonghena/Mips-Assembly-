# this program prints out the maximum of two numbers 
# The two numbers are read through the keyboard 
# Alex Onghena
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

#Branch (jump) to L1 if $t1 is greater or equal to $t0
bge $t1, $t0, L1  

# largest number in $t1  
move $t1, $t0 	    

# print answer 
L1: 
li $v0, 4 
la $a0, answer
syscall

# print integer function call 1 
# put the answer into $a0
li $v0, 1 
move $a0, $t1 
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
 .asciiz "The largest number is "
