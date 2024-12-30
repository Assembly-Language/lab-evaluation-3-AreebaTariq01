include Irvine32.inc

.data
zeroCount DWORD 0  

.code
countZeros PROC
    
    ; EAX -> Pointer to the array
    ; EDX -> Size of the array (number of elements)

    push ebp             ; Set up the stack frame
    mov ebp, esp

    mov esi, [ebp + 8]   ; ESI = array pointer
    mov ecx, [ebp + 12]  ; ECX = size of the array
    xor eax, eax         ; EAX = zero count (initialize to 0)

count_loop:
    cmp ecx, 0           ; Check if all elements are processed
    je end_loop          ; Exit loop if ECX is 0

    mov edx, [esi]       ; Load current array element into EDX
    cmp edx, 0           ; Check if the value is zero
    jne not_zero         ; Skip increment if not zero

    inc eax              ; Increment zero count if value is zero

not_zero:
    add esi, 4           ; Move to the next element (4 bytes per element)
    loop
asmfunc ENDP
end 