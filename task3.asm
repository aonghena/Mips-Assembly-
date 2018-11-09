# this program prints out the maximum of two numbers 
# The two numbers are read through the keyboard 
#Alex Onghena
.text
.globl main

main:
# Display primpt1
li $v0, 4
la $a0, prompt1
syscall

li $v0, 5 # read keyboard into $v0 (number x is number to test)
syscall

# move the input number from $v0 in $t9
move $t0,$v0 

# Display primpt1
li $v0, 4
la $a0, prompt1
syscall

li $v0, 5 # read keyboard into $v0 (number x is number to test)
syscall

# move the input number from $v0 in $t9
move $t1,$v0 


#output anwser prompt
li $v0, 4 
la $a0, answer
syscall

#loop


or $t0, $t1, $t0
bne $t0, $0, equal
add $t0, $0, 1
j skip

equal:
move $t0, $0

skip:
li $v0, 1 
move $a0, $t0 
syscall









#exit
end: li $v0, 10 
syscall 
 
.data
prompt1:
 .asciiz "User Input "

answer:
 .asciiz "Program Output "
 
comma:
 .asciiz ", "
