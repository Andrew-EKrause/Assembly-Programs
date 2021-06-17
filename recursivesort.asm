# MIPS Recursive Sort Program
# Andrew Krause
# Date: 11/06/2020
#
# Description: The program reads in (from standard input) an array of values, and prints
# (to standard output) the array sorted in ascending order. Function calls are made to 
# complete the task of recursively sorting the array in the program. 

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
arr:	.space	80			 			# 20 maximum elements * 4 bytes = 80 bytes
len:	.space 	4						# the length of the array entered in by the user
left:	.space	4						# index of first value in the array
right:	.space	4						# index of last value in the array

# end data segment

#===================================================================================================================

# begin text segment 
#
# Key: 	
# len, i --> $s0; 
# value, j --> $s1; 
# array --> $s2; 
# left,--> $s3; 
# right --> $s4; 
# tmp --> $s5;
# pivot, space, comma --> $s6;
# index, k, sorted --> $s7;
# int arr[] --> $a0 for parameter1;
# int left --> $a1 for parameter2;
# int right --> $a2 for parameter3;

	.text				# instructions start here
MAIN:	la	$s0,	len		# load address of len into $s0
	la	$s2,    arr		# load address of arr into $s2
	la	$s3,	left		# load address of left into $s3 
	la	$s4,	right		# load address of right into $s4
	addi	$s7,	$zero,	0	# k = 0

	# read in a new integer for the size of the array check if input is invalid
	addi	$v0, 	$zero,	5	# read int service
	syscall				# ask user for length of arr
	add	$s0, 	$zero, 	$v0	# put data from user into $s0 (len)
	add	$s3,	$zero,	$v0	# put data from user into $s3 (left) 
	add	$s4,	$zero,	$v0	# put data from user into $s4 (right) 
	addi	$t0, 	$zero, 	0	# store 0 in the $t0 register
	slt   	$t1, 	$t0, 	$s0	# (len <= 0) == !(len > 0) so 0 < len
	beq	$t1, 	$zero, 	END	# !(0 < len) --> goto END
	addi	$t2,	$zero,	20	# store 20 in the $t0 register
	slt   	$t3, 	$t2, 	$s0	# (len > 20) so 20 < len
	bne	$t3, 	$zero, 	END	# !(20 < len) --> goto END 
	addi	$s3, 	$zero, 	0	# set left, which is $s3, equal to zero
	addi	$s4,	$s0,	-1	# set right = len - 1
	
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
	
	# after user input is collected, store arr, left, and right for use in QUICK
CALL:	add	$a0,	$s2,	$zero	# store arr in $a0 to be used in function
	add	$a1,	$s3,	$zero	# store left in $a1 for use in function	
	add	$a2,	$s4,	$zero	# store right in $a2 for use in function
	jal	QUICK			# call the function QUICK to partition array

	# store the array that was sorted in the QUICK function
	add	$s2,	$zero,	$v0	# recall value returned by function in $s2 

	# after the method call, begin printing out the sorted array
	la 	$s7, 	sorted		# load address of string into $s7
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
	
	# call the string named 'comma' to print out a comma
	la	$s6, 	comma		# load the address of the string into $s6
	addi	$v0, 	$zero, 	4	# read string service 
	add	$a0, 	$zero, 	$s6	# prepare string for printing
	syscall				# print the string comma 
	
	# call the string named 'space' to print out a space
	la	$s6, 	space		# load address of string into $s6 
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
PART:	addi	$sp,	$sp,	-16	# move stack down for the four function variables
	sw	$s0,	0($sp)		# store i (first counter variable with left)
	sw	$s1,	4($sp)		# store j (second counter variable with right)
	sw	$s5,	8($sp)		# store temp (variable for swapping)
	sw	$s6,	12($sp)		# store pivot (local variable in this function)
	
	# initialize local variables i and j in the function
	add	$s0,	$a1,	$zero	# store the value of left in i
	add	$s1,	$a2,	$zero	# store the value of right in j

	# initialize the local variable of pivot in the function
	add	$t0, 	$a1,	$a2	# left + right 
	srl	$t1,	$t0,	1	# (left + right) / 2
	sll	$t2,	$t1,	2	# ( (left + right) / 2 ) * 4
	add	$t2,	$t2,	$a0	# address of arr[(left + right) / 2] 
	lw	$t3,	0($t2)		# value of arr[(left + right) / 2]
	add	$s6,	$t3,	$zero	# pivot = value of arr[(left + right) / 2]
	
	# create the first while loop for determining the traversal in the array
PFOR1:	slt	$t4,	$s1,	$s0	# (i <= j) == !(i > j) == j < i
	bne	$t4,	$zero,	PRET	# !(j < i) --> goto PRET
	
	# begin first nested while loop
NPFOR2:	sll	$t5,	$s0,	2	# i * 4
	add	$t5,	$t5,	$a0	# address of arr[i]
	lw	$t5,	0($t5)		# value of arr[i]

	# prepare arr[i] for comparison in first nested while loop
	slt	$t6,	$t5	$s6	# arr[i] < pivot
	beq	$t6,	$zero,	NPFOR3	# !(arr[i] < pivot) --> goto NPFOR3	
	addi	$s0,	$s0,	1	# i++
	j	NPFOR2			# loop!
	
	# begin second nested while loop
NPFOR3:	sll	$t7,	$s1,	2	# j * 4
	add	$t7,	$t7,	$a0	# address of arr[j]
	lw	$t7,	0($t7)		# value of arr[j]	
	
	# prepare arr[j] for comparison in second nested while loop
	slt	$t0,	$s6,	$t7	# arr[j] > pivot == pivot < arr[j]
	beq	$t0,	$zero	PIF	# !(pivot < arr[j]) --> go to PIF
	addi	$s1,	$s1,	-1	# j--
	j	NPFOR3			# loop!
	
	# if-statement for swapping values in array
PIF:	slt	$t1,	$s1,	$s0	# (i <= j) == !(i > j) == j < i
	bne	$t1,	$zero,	PFOR1	# !(j < i) --> goto PFOR1
	
	# part 1 of swaping values in the array
	sll	$t2,	$s0,	2	# i * 4
	add	$t2,	$t2,	$a0	# address of arr[i]
	lw	$t3,	0($t2)		# value of arr[i]
	add	$s5,	$t3,	$zero	# tmp = arr[i] --> 1st part of swap
	
	# part 2 of swapping values in the array
	sll	$t4,	$s1,	2	# j * 4
	add	$t4,	$t4,	$a0	# address of arr[j]
	lw	$t5,	0($t4)		# value of arr[j]
	sll	$t2,	$s0,	2	# i * 4
	add	$t2,	$t2,	$a0	# address of arr[i]
	sw	$t5,	0($t2)		# arr[i] = arr[j] --> 2nd part of swap
	
	# part 3 of swapping values in the array
	sll	$t6,	$s1,	2	# j * 4
	add	$t6,	$t6,	$a0	# address of arr[j]
	sw	$s5,	0($t6)		# arr[j] = tmp --> 3rd part of swap
	
	# increment i and j before jumping to outer while loop
	addi	$s0,	$s0	1	# i++
	addi	$s1,	$s1	-1	# j--
	j	PFOR1			# loop!	

	# store return value, restore $s registers from stack, and pop stack
PRET:	add	$v0,	$zero,	$s0	# put the value of i in $v0 
	lw	$s0,	0($sp)		# load i (first counter variable that had left)
	lw	$s1,	4($sp)		# load j (second counter variable that had right)
	lw	$s5,	8($sp)		# load tmp (variable for swapping)
	lw	$s6,	12($sp)		# load pivot (variable for sorting array parts)
	addi	$sp,	$sp,	16	# pop the stack (move it back up)
	jr	$ra			# restore everything and return with the value of i
# ---------------------------------------------------------------------------------------------------	
QUICK:	addi	$sp,	$sp,	-20	# move stack down for the five function variables
	sw	$a0,	0($sp)		# store arr (array being sorted in the program)
	sw	$a1,	4($sp)		# store left (used in recursive sorting method)
	sw	$a2,	8($sp)		# store right (used in recursive sorting method)
	sw	$s0,	12($sp)		# store index (local variable in this function)
	sw	$ra,	16($sp)		# store $ra (return value for the recursive method)

	# call PART and store the value obtained by that function for use in QUICK
	jal	PART			# call the function PART to partition the array
	add	$s0,	$zero,	$v0	# recall value returned by function in $s0 (index) 
	
	# first if-statement for first recursive call
QIF1:	addi	$t0,	$s0,	-1	# index - 1
	slt	$t1,	$a1,	$t0	# left < index - 1
	beq	$t1,	$zero,	LOAD	# !(left < index - 1) --> goto LOAD
	addi	$a2	$t0,	0	# store index - 1 in $a2 
	jal	QUICK			# call QUICK (recursive call)
LOAD: 	lw	$a2,	8($sp)		# load right variable for second recursive call
	
	# second if-statement for second recursive call
QIF2:	slt	$t2,	$s0,	$a2	# index < right
	beq	$t2,	$zero	QRET	# !(index < right) --> goto QRET
	add	$a1,	$s0,	$zero	# update argument
	jal	QUICK			# call QUICK (recursive call)
	
	# store return value, restore registers, and pop the stack in recursive process
QRET:	add	$v0,	$zero,	$s2	# return array (sorted once completed)
	lw	$a0,	0($sp)		# restore arr (array being sorted in program)
	lw	$a1,	4($sp)		# restore left (used in recursive sorting method)
	lw	$a2,	8($sp)		# restore right (used in recursive sorting method)
	lw	$s0,	12($sp)		# restore index (local variable in function)
	lw	$ra,	16($sp)		# restore $ra, (acts as a return value for recursion)
	addi	$sp,	$sp,	20	# pop the stack (move it back up)
	jr	$ra			# restore everything and return
# ---------------------------------------------------------------------------------------------------														
# end text segment
