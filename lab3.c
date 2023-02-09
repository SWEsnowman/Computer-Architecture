#include <stdio.h>
#include <math.h>
#include <stdlib.h>
float equation(float x){
    return 2.5*pow(x,3) - 15.5*pow(x,2) + 20*x + 15;
}
int main(int argc, char const *argv[]){
    float epsilon = 0.0001;
    float a = atof(argv[1]);
    float b = atof(argv[2]);
    int num_of_rectangles = atoi(argv[3]);
    if (b < a){
        printf("The upper bound needs to be greater than the lower bound");
    }else{
        float length_of_rectangle = (b-a)/num_of_rectangles;
        float new_val = 1;
        float old_val = 0;
        while(new_val - old_val > epsilon){
            float approx = 0.0;
            int multi = 1;
            for(int i = 1; i <= num_of_rectangles; i++){
                approx = approx + length_of_rectangle*equation(a+(multi*length_of_rectangle)/2);
                multi = multi + 2;
            }
            old_val = new_val;
            new_val = approx;
            length_of_rectangle = length_of_rectangle/2;
            num_of_rectangles = num_of_rectangles*2;
        
        }
        printf("The number of rectangles in the last calculation: ");
        printf("%d\n", num_of_rectangles/2);
        printf("The last two values of the calculation: ");
        printf("%f ", old_val);
        printf("%f", new_val);
    }
    
}
