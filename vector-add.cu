#include<stdio.h>
#include<iostream>
#include<cuda_runtime.h>

// CPU function
void addVectors(const float *a, const float *b, float *c, int n){
    for(int i = 0; i < n; i++){
        c[i] = a[i] + b[i];
    }
    return;
}

int main(){
    float *a, *b, *c;
    int n = 10;
    size_t size = n*sizeof(float);
    a = (float*)malloc(size);
    b = (float*)malloc(size);
    c = (float*)malloc(size);

    for(int i=0; i<n; i++){
        a[i] = i;
        b[i] = i;
    }

    addVectors(a, b, c, n);

    std::cout << std::endl;
    for(int i=0; i<n; i++)
        std::cout<< c[i] << " ";

    free(a);
    free(b);
    free(c);

    return 0;
}