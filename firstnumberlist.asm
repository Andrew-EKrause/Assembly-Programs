# MIPS Hello World Program 1
# Andrew Krause
# Date: 10/12/2020
#
# Description: Simple MIPS program displays 12 values in decreasing order 
# by 7. The program should start with 700, and the variable should be  
# initialized in the .data segment.

# Steps:
#	- plan out data structures
#	- plan out code
#	- implement
#	- test and debug

# begin data segment
	.data
num:	.word	12		# reserve space for a num and initialize it to 12
start:	.word	700		# reserve a space for start and initialize it to 700
i:	.space	4		# counter variable
space:	.asciiz	" "		# space to insert between numbers
	.align	2		# align data segment after each string

# end of data segment

#========================================================================================	

# begin text segment
#
# Key: 
# num --> $s0
# space --> $s1 
# start --> $s2
# i --> $s3

	.text				# instructions start here
MAIN:	la	$s0, 	num		# load address of num, which is 12, for use
	lw 	$s0, 	0($s0)		# load value of num into register $s0
	la	$s1, 	space		# load address of space for use
	la	$s2, 	start		# load address of start, which is 700, for use
	lw	$s2, 	0($s2)		# load value of start into register $s2
	
	# the value of i is set to zero and the conditional is executed
	addi	$s3, 	$zero,	0	# set i to zero
LOOP:	slt	$t0, 	$s3, 	$s0	# i < num (num = 12 for this program)
	beq	$t0, 	$zero, 	END	# !(i < num) --> go to end (when done)
	
	# the value of start is printed out each time in the loop execution 
	add	$a0, 	$zero, 	$s2	# put start in $a0 to print
	addi	$v0, 	$zero, 	1	# set up for print int
	syscall				# print int, which is value of start
	
	# the value of 7 is subtracted from teh value of start
	addi	$t0, 	$zero, 	7	# store the value of 7 in a temporary register
	sub	$s2, 	$s2, 	$t0	# subtract 7 from the value of start
	
	# a space is printed out to separate the different values in the loop
	add	$a0, 	$zero, 	$s1	# put space in $a0
	addi	$v0, 	$zero, 	4	# set up for print string
	syscall				# print string, which is space
	
	# the counter variable, i, is incremented and the loop continues
	addi	$s3, 	$s3, 	1	# i++ (i = i + 1)
	j 	LOOP			# loop!
	
	# when the loop is completed, exit the program
END:	addi	$v0, 	$zero,	10	# system call for exit
	syscall				# clean termination of program
	
# end text segment
	
