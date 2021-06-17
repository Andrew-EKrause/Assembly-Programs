# MIPS Hello World Program 3
# Andrew Krause
# Date: 10/12/2020
#
# Description: Simple MIPS program displays 12 values in decreasing order 
# by 7. The program should start with an integer value entered in by the 
# user, and the variable should be initialized in the .data segment.

# Steps:
#	- plan out data structures
#	- plan out code
#	- implement
#	- test and debug

# begin data segment
	.data
num:	.word	12		# reserve space for a num and initialize it to 12
start:	.space	4		# reserve a space for start 
i:	.space	4		# counter variable
space:	.asciiz	" "		# space to insert between numbers
	.align	2		# align data segment after each string

# end data segment

#===============================================================================================	

# begin text segment
# Key: 
# num --> $s0
# space --> $s1 
# start --> $s2
# i --> $s3

	.text				# instructions start here	
MAIN:	la	$s0, 	num		# load address of num, which is 12, for use
	lw 	$s0, 	0($s0)		# load value of num into register $s0
	la	$s1, 	space		# load address of space for use
	la	$s2, 	start		# load address of start for use
	lw	$s2, 	0($s2)		# load value of start (empty) into register $s2
	addi	$s3, 	$zero,	0	# set i to zero
	
	# read in a new integer from the user			
	addi 	$v0,	$zero,	5	# read int service (integer so 5 bytes)
	syscall 			# ask user for a new int
	
	# the value entered prepared to print; initial start value printed in LOOP
	add  	$s2,	$zero,	$v0	# put data read in from user into start
	addi 	$v0,	$zero,	1	# print int service
	add  	$a0,	$zero,	$s2	# value to print out
	
	# loop for subtracting 7 from the entered value of start
LOOP:	slt	$t0,	$s3,	$s0	# i < num (num = 12 for this program)
	beq	$t0,	$zero,	END	# !(i < num) --> go to end (when done)
	
	# the current value of start is printed out each iteration of the loop
	add	$a0,	$zero,	$s2	# put start in $a0 to print
	addi	$v0,	$zero,	1	# set up for print int
	syscall				# print int, which is value of start
	
	# subtract 7 from the value of start, which is the user input
	addi	$t0,	$zero,	7	# store the value of 7 in a temporary register
	sub	$s2,	$s2,	$t0	# subtract 7 from the value of start
	
	# print out a space between each value printed out in the loop
	add	$a0,	$zero,	$s1	# put space in $a0
	addi	$v0,	$zero,	4	# set up for print string
	syscall				# print string, which is space
	
	# continue looping through the arguments
	addi	$s3,	$s3,	1	# i++ (i = i + 1)
	j 	LOOP			# loop!
	
	# when loop is completed, exit the program 
END:	addi	$v0,	$zero,	10	# system call for exit
	syscall				# clean termination of program
	
# end text segment
