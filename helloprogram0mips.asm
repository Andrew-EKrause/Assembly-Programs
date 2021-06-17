# MIPS Hello World Program 0
# Andrew Krause
# Date: 10/12/2020
#
# Description: Simple MIPS program prints out the string "Hello World". The program also
# prints out the value of 'i' as it changes throughout a for loop that impacts the value.

# Steps:
#	- plan out data structures
#	- plan out code
#	- implement
#	- test and debug

# begin data segment
	.data
hi:	.asciiz	"Hello World!\n"	# create a null-terminated string "Hello World!"
	.align	2			# align data segment after each string
num:	.word	5			# reserve space for a number and initialize it to 5
i:	.space	4			# counter variable (allocate 4 bytes of space for it)
space: 	.asciiz	" "			# space to insert between numbers
	.align	2			# align data segment after each string
	
# end of data segment

#===============================================================================================	

# begin text segment
#
# Key: 
# hi --> $s0
# num --> $s1
# space --> $s2
# i --> $s3

	.text				# instructions start here
MAIN:	la 	$s0, 	hi		# load address of string hi
	add 	$a0, 	$zero, 	$s0	# put address of hi in $a0 to print
	addi 	$v0, 	$zero, 	4	# put 4 in $v0 for printing a string
	syscall				# print string
	
	# obtain the value of the integer num for the loop
	la 	$s1, 	num		# load address of num for use
	lw 	$s1, 	0($s1)		# load value of num into register
	la 	$s2, 	space		# load address of space for use
	
	# loop through and print out the value of i as it changes in the loop
	addi	$s3, 	$zero, 	0	# set i to zero 
LOOP:	slt 	$t0, 	$s3, 	$s1	# i < num
	beq 	$t0, 	$zero, 	END	# !(i < num) --> go to end (when done)
	
	# print i each time the loop goes throuhg the arguments within it
	add 	$a0, 	$zero, 	$s3	# put i in $a0 to print (int)
	addi	$v0, 	$zero, 	1	# set up for print int
	syscall				# print int
	
	# print space to separate the values printed out
	add 	$a0, 	$zero, 	$s2	# put space in $a0 to print
	addi 	$v0, 	$zero, 	4	# set up for print string	
	syscall				# print string
	
	# increase the counter, which is i, and keep looping
	addi 	$s3, 	$s3, 	1	# i++
	j	LOOP			# loop!
	
	# when the loop is completed, exit the program
END:	addi 	$v0, 	$zero, 	10	# system call for exit
	syscall				# clean termination of program

# end text segment
	
