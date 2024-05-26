; 
; CSCI268 - Final - Summing the Gaps between Array Valuess
; Miranda Morris
; 4/18/2024
; This code uses a loop and indexed addressing to 
; calculate the sum of all the gaps between 
; successive array elements. The array elements
; are doubleword, sequenced in nondecreasing order

; An example would be the array {0, 2, 5, 9, 10} has
; gaps of 2,3,4, and 1, whose sum equals 10.

.586
.model flat, stdcall
option casemap : none; case-sensitive

ExitProcess proto,dwExitCode:dword


INCLUDE Irvine32.inc

.data	; Start of data segment
array DWORD 0,2,5,9,10	; creating a DWORD array with those elements
result DWORD 0	; creating a DWORD variable with the name result


.code	; Start of code segment
main proc	; Start of main procedure
mov ecx, LENGTHOF array	; moves the value of the array length to the ecx register
mov esi, OFFSET array	; moves the value of the offset of the array to the esi array

L1:	; Creating a loop named L1

mov eax,[esi]	; moves the offset value from the esi register to the eax register
mov ebx,[esi+4]	; moves the value of esi+4 to the ebx register
sub ebx,eax	; subtracts the current number from previous number and store the answer in the ebx register
add result,ebx	; add the answer to the result variable
add esi, TYPE array	; move the pointer to the next array element

loop L1	; Loop through L1

	invoke ExitProcess,0
main endp

end main
