# MIPS Hello World Program 2
# Andrew Krause
# Date: 10/12/2020
#
# Description: Simple MIPS program prints out the sum of an indice with the previous
# value of that indce as it increases throughout a while loop. The example code is 
# shown below:

# Java code
#
# int i = 0;
# int sum = 0; 
# while(i < 10){
# 	sum = sum + i ; 
# 	System.out.print(sum + ” ”); 
# 	i ++;
# }
#

# Steps:
#	- plan out data structures
#	- plan out code
#	- implement
#	- test and debug

# begin data segment
	.data 
sum:	.word	0		# reserve space for sum and initialize it to 0
space:	.asciiz	" "		# space to insert in print statement
	.align	2		# align data segment after each string
i:	.space	4		# counter variable
	
# end data segment

#====================================================================================	

# begin text segment
# Key:  
# space --> $s0 
# i --> $s1
# sum --> $s2

	.text				# instructions start here
MAIN:	la	$s0, 	space		# load address of space for use
	addi 	$s1, 	$s1, 	0	# set i to zero
	addi 	$s2, 	$s2, 	0	# set sum to zero
	
	# the loop runs twelve times and subtracts the value of 7 from user input
LOOP:	slti	$t0, 	$s1, 	10	# i < 10
	beq	$t0, 	$zero, 	END	# !(i < 10) --> goto END (when done)
	add	$s2, 	$s2, 	$s1	# sum = sum + i
	
	# the result of the computation where 7 is subtracted is printed
	add	$a0, 	$zero, 	$s2	# put sum in $a0 to print (int)
	addi	$v0, 	$zero, 	1	# set up for print int (sum)
	syscall				# print int (sum)
	
	# a space is printed between each value printed out in the loop
	add	$a0, 	$zero, 	$s0	# put space in $a0 to print (string)
	addi	$v0, 	$zero, 	4	# set up for print string (space)
	syscall				# print string (space)
	
	# the counter variable, i, is incremented
	addi	$s1, 	$s1, 	1	# i++
	j	LOOP			# loop!
	
	# when the loop is completed, exit the program
END:	addi	$v0, 	$zero,	10	# system call for exit
	syscall				# clean termination of program

# end text segment

