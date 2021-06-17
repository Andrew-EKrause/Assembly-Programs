# MIPS Simple Sort Program
# Andrew Krause
# Date: 10/23/2020
#
# Description: The program reads in (from standard input) an array of values, and prints
# (to standard output) the array sorted in ascending order. A function call is made to 
# complete the task of sorting the array in the program. 

# Steps:
#	- plan out data structures
#	- plan out code
#	- implement
#	- test and debug

# begin data segment
	.data
sorted:	.asciiz	"The elements sorted in ascending order are: " 	# prints out message before the reversed array
	.align	2			 	 		# aligns the data segment
space:	.asciiz	" "						# space for nicer printing
	.align	2						# aligns the data segment
comma:	.asciiz	","						# seperator for nicer printing
	.align	2						# algins the data segment
arr:	.space	80			 			# normal array: 20 maximum elements * 4 bytes = 80 bytes

# end data segment

#==========================================================================================================================

# begin text segment 
#
# Key: 	
# len --> $s0; 
# value --> $s1; 
# array --> $s2; 
# i --> $s3; 
# j --> $s4;
# tmp --> $s5;
# minIndex, space, comma --> $s6;
# k, sorted --> $s7;
# int arr[] --> $a0 for parameter1;
# int len --> $a1 for parameter2;

	.text				# instructions start here
MAIN:	la	$s2,    arr		# load address of arr into $s2
	addi	$s7,	$zero,	0	# k = 0

	# read in a new integer for the size of the array check if input is invalid
	addi	$v0, 	$zero,	5	# read int service
	syscall				# ask user for length of arr
	add	$s0, 	$zero, 	$v0	# put data from user into $s0 (len)
	addi	$t0, 	$zero, 	0	# store 0 in the $t0 register
	slt   	$t1, 	$t0, 	$s0	# (len <= 0) == !(len > 0) so 0 < len
	beq	$t1, 	$zero, 	END	# !(0 < len) --> goto END
	addi	$t2,	$zero,	20	# store 20 in the $t0 register
	slt   	$t3, 	$t2, 	$s0	# (len > 20) so 20 < len
	bne	$t3, 	$zero, 	END	# !(20 < len) --> goto END 
	
	# inside the loop, read in the values for each slot of the array
MFOR1:	slt	$t0, 	$s7, 	$s0	# k < len
	beq	$t0, 	$zero, 	CALL	# !(k < len) --> goto CALL	
	addi	$v0, 	$zero, 	5	# read int service
	syscall				# ask user for value that will go in arr[k]
	add	$s1, 	$zero, 	$v0	# put data read in by user into value
	
	# store array values in order to use for retrieval later in the program
	sll	$t1, 	$s7, 	2	# k * 4
	add	$t1, 	$t1, 	$s2	# address of arr[k]
	sw	$s1, 	0($t1)		# store arr[k] = value in memory
	addi	$s7, 	$s7, 	1	# k++
	j	MFOR1			# loop!
	
	# after user input is collected, store arr and len for use in function
CALL:	add	$a0,	$s2,	$zero	# store arr in $a0 to be used in function
	add	$a1,	$s0,	$zero	# store len in $a1 to be used in function
	jal	SORT			# call the function SORT 

	# after function SORT is completed, store the value obtained by the function
	add	$s2,	$zero,	$v0	# recall value returned by function in $s2

	# after the method call, begin printing out the sorted array
	la 	$s7, 	sorted		# load address of string 'sorted' into $s7
	addi 	$v0, 	$zero, 	4	# print string service
	add	$a0, 	$zero, 	$s7	# $a0 = $s7 = sorted
	syscall				# print the string named 'sorted'
	
	# begin printing out the values of the sorted array while formatting output
	addi	$s7,	$zero,	0	# k = 0
MFOR2: 	slt	$t0, 	$s7, 	$s0	# k < len
	beq	$t0, 	$zero, 	END	# !(k < len) --> goto END
	
	# obtain the value in the sorted array by accessing memory
	sll	$t1, 	$s7, 	2	# k * 4
	add	$t1, 	$t1, 	$s2	# address of arr[k]
	lw	$t2, 	0($t1)		# load address of array into $t2
	
	# print the value in memory from the sorted array 
	addi	$v0, 	$zero,	1	# read int service
	add	$a0, 	$zero, 	$t2	# prepare int for printing
	syscall				# print the int
	
	# determine the comma placement between each value
	addi 	$s7, 	$s7, 	1	# add an extra one to k for comma placement
	slt	$t6, 	$s7, 	$s0	# (k < len) 
	beq	$t6, 	$zero, 	MELSE	# !(k < len) --> goto MELSE
	addi	$s7, 	$s7, 	-1	# subract one from k after check 
	
	# print the string called 'comma' to print out a comma
	la	$s6, 	comma		# load the address of the string comma into $s6
	addi	$v0, 	$zero, 	4	# read string service 
	add	$a0, 	$zero, 	$s6	# prepare string for printing
	syscall				# print the string comma 
	
	# print the string called 'space' to print out a space
	la	$s6, 	space		# load address of string 'space' into $s6 
	addi	$v0, 	$zero, 	4	# read string service 
	add	$a0, 	$zero, 	$s6	# prepare string for printing
	syscall				# print the string space
	addi	$s7, 	$s7, 	1	# k++
	j	MFOR2			# skip over MELSE and loop 
	
	# if a comma is not needed, skip comma and loop
MELSE:	addi	$s7, 	$s7,	1	# k++
	j	MFOR2			# loop MFOR2

	# after the END section is reached, terminate the program
END:	addi	$v0, 	$zero, 10	# system call for exit
	syscall				# clean termination of program
	
# -------------------------------------------------------------------------------------------------- 	
SORT:	addi	$sp,	$sp,	-16	# move stack down to make space for four function values
	sw	$s3,	0($sp)		# store i, which is the first counter variable
	sw	$s4,	4($sp)		# store j, which is the second counter variable
	sw	$s5,	8($sp)		# store temp, which is the variable for swapping
	sw	$s6,	12($sp)		# store minIndex, which is a variable for the array	

	# begin the first loop in the sorting method 
	addi	$s3,	$zero,	0	# i = 0
	addi	$t6,	$a1,	-1	# len = len - 1
SFOR1:	slt	$t0,	$s3,	$t6	# i < len - 1 
	beq	$t0,	$zero,	SRET	# !(i < len - 1) --> goto SRET to return values
	add	$s6,	$zero,	$s3	# minIndex = i
	
	# begin the second loop
	addi	$s4,	$s3,	1	# j = i + 1
SFOR2:	slt	$t1,	$s4,	$a1	# j < len
	beq	$t1,	$zero,	SWAP	# !(j < len) --> goto SWAP	
	
	# obtain array values entered in by the user swap
	sll	$t2,	$s6,	2	# minIndex * 4 (first reference for comparison)
	add	$t2, 	$t2,	$a0	# address of arr[minIndex]	
	lw	$t2,	0($t2)		# value of arr[minIndex] 
	sll	$t3,	$s4,	2	# j * 4 (second refernce for comparison)
	add	$t3,	$t3,	$a0	# address of arr[j]
	lw	$t3,	0($t3)		# value of arr[j]
	
	# inside the for loop, check conditional 
	slt	$t4,	$t3,	$t2	# arr[minIndex] > arr[j] == arr[j] < arr[minIndex]
	beq	$t4,	$zero,	SKIP1	# !(arr[j] < arr[minIndex]) --> goto SKIP1 
	add	$s6,	$zero,	$s4	# minIndex = j
	
	# start the inner loop again
SKIP1:	addi	$s4,	$s4,	1	# j++
	j	SFOR2			# loop!
	
	# part 1 for performing swap in the array
SWAP:	beq	$s6,	$s3,	SKIP2	# if(minIndex != i) --> goto SKIP2
	sll	$t0,	$s6,	2	# minIndex * 4
	add	$t0,	$t0,	$a0	# address of arr[minIndex]
	lw	$t1,	0($t0)		# value of arr[minIndex]
	add	$s5,	$t1,	$zero	# tmp = arr[minIndex] --> 1st part of swap
	
	# part 2 for performing swap in the array
	sll	$t2,	$s3,	2	# i * 4
	add	$t2,	$t2,	$a0	# address of arr[i]
	lw	$t3,	0($t2)		# value of arr[i]
	sll	$t0,	$s6,	2	# minIndex * 4
	add	$t0,	$t0,	$a0	# address of arr[minIndex]
	sw	$t3,	0($t0)		# arr[minIndex] = arr[i] --> 2nd part of swap

	# part 3 for performing swap in the array
	sll	$t4,	$s3,	2	# i * 4
	add	$t4,	$t4,	$a0	# address of arr[i]
	sw	$s5,	0($t4)		# arr[i] = tmp --> 3rd and final part of swap

	# start the outer for loop again
SKIP2:	addi	$s3,	$s3,	1	# i++
	j	SFOR1			# loop! 

	# store return value, restore $s registers from stack, and pop stack
SRET:	add	$v0,	$zero,	$s2	# put the sorted array in $v0 
	lw	$s3,	0($sp)		# load i, which was the first counter variable
	lw	$s4,	4($sp)		# load j, which was the second counter variable
	lw	$s5,	8($sp)		# load temp, which was the variable for swapping
	lw	$s6,	12($sp)		# load minIndex, which was a variable for the array
	addi	$sp,	$sp,	16	# pop the stack (move it back up)
	jr	$ra			# jump back to the method call with the sorted array
# --------------------------------------------------------------------------------------------------								
# end text segment

