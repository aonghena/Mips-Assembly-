
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


li $a1, 83 #source S
li $a2, 65 #temp A
li $a3, 68 #dest D
move $a0, $t0
jal hanoiMoves


li $v0, 4
la $a0, prompt2
syscall
li $v0, 1
move $a0, $v1
syscall
j target

hanoiMoves: 



bne $a0, 1, else
li $v0, 4
la $a0, prompt3
syscall
li $v0, 11
move $a0, $a1
syscall
li $v0, 4
la $a0, prompt4
syscall
li $v0, 11
move $a0, $a3
syscall
addi $v1, $v1, 1	
jr $ra


else:
addi $sp, $sp, -20

#put in stack
sw $a0, 16($sp)
sw $a3, 12($sp)
sw $a2, 8($sp)
sw $a1, 4($sp)
sw $ra, 0($sp)

addi $a0, $a0, -1 
move $t1, $a2
move $a2, $a3
move $a3, $t1
jal hanoiMoves

lw $a0, 16($sp)
lw $a3, 12($sp)
lw $a2, 8($sp)
lw $a1, 4($sp)

move $t1, $a0

li $a0, 1


jal hanoiMoves
move $a0, $t1
addi $a0, $a0, -1
move $t1, $a1
move $a1, $a2
move $a2, $t1
move $a3, $a3


jal hanoiMoves

lw $ra, 0($sp)

addi $sp, $sp, 20


jr $ra


target:

#exit
end: li $v0, 10 
syscall 
 
.data
prompt1:
 .asciiz "How many disks "
prompt2:
 .asciiz "\nMoves "
 prompt3:
 .asciiz "\nMove from tower "
  prompt4:
 .asciiz " to tower "
answer:
 .asciiz "The output number is "
 
 space:
 .asciiz " "
