# Load the program into QtSpim and look at the data segment starting at address 
# 0x10000000. There are no machine instructions in this program so there is 
# nothing to run. Notice that fullwords (4 bytes) are used for each integer. 
# QtSpim memory can be displayed using binary, decimal, or hex using the menu 
# under the "Data Segment" tab at the top. Choosing a display option merely 
# changes the characters used to display what is in memory. Of course, the 
# contents of memory remains unchanged.
#
# Change several of the data in your program to large decimal values (say, 
# 2435681). Load the program. If memory is displayed in hex, the hex equivalent 
# of the decimal values will be displayed.

		.data
		
data:
		.word	0
		.word	1
		.word	2
		.word	3
		.word	4