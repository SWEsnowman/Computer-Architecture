#include <stdio.h>
#include <stdlib.h>

void display(int8_t bit) {
    putchar(bit + 48);
}

void display_32(int32_t num) {
    int temp[32];
    if (num < 0){
        temp[0] = 1;
        num = -1*num;
    } 

    for(int i = 31; i > 0; i--){
        // int32_t temp = 1;
        // temp >> i;
        //printf("%d ", num);
        if (num & 1){
            temp[i] = 1;
        }else{
            temp[i] = 0;
        }
        num >>= 1;
        
    }
    display(num);
    for(int i = 0; i < 32; i++){
        printf("%d", temp[i]);
    }
    
}

int main(int argc, char const *argv[]) {
    int32_t x = 382;
    display_32(x);

    return 0;
}
