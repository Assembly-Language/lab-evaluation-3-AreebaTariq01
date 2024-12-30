
#include <stdio.h>


extern int count_zeros(int *arr, int size);

int main() {

    // declare an array
    int arr[] = {0, 3, 0, 5, 7, 0, 8};
    int size = sizeof(arr) / sizeof(arr[0]);

    // Calling the Assembly function
    int zero_count = count_zeros(arr, size);

    // Display the result
    printf("Total number of zeros in the array: %d\n", zero_count);

    return 0;
}