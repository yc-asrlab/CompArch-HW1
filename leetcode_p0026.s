.data
nums:   .word 1, 1, 2, 3, 3  # Example array
size:   .word 5              # Array size

    .text
    .globl main

main:
    li t0, 1             # k = 1 (index for unique elements)
    li t1, 1             # i = 1 (loop index)
    la t2, nums          # Load the starting address of nums array
    lw t3, size          # Load the size of the array

loop:
    beq t1, t3, print_result  # If i == size, jump to print_result

    lw t4, 0(t2)         # Load nums[i-1]
    lw t5, 4(t2)         # Load nums[i]

    bne t4, t5, unique   # If nums[i-1] != nums[i], jump to unique

    addi t2, t2, 4       # Move to the next element
    addi t1, t1, 1       # Increment i
    j loop               # Continue loop

unique:
    addi t0, t0, 1       # Increment k (count of unique elements)
    addi t2, t2, 4       # Move to the next element
    addi t1, t1, 1       # Increment i
    j loop               # Continue loop

print_result:
    mv a0, t0            # Copy k to a0 (for printing)
    li a7, 1             # System call number 1 (PrintInt)
    ecall                # Execute PrintInt system call

exit:
    li a7, 10            # System call number 10 (Exit)
    ecall                # Terminate the program
