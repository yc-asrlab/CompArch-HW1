#include<stdio.h>

int main(void) {
    int nums[5] = {1,1,2,2,3};
    int k = 1;
    for (int i = 1; i < 5; ++i) {
        if (nums[i] != nums[i - 1]) {
            nums[k++] = nums[i];
        }
    }
    printf("%d", k);
    return k;
}