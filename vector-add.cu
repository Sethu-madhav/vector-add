#include <stdio.h>
#include <iostream>
#include <chrono>
#include <cuda_runtime.h>

// CPU function
void addVectors(const float *a, const float *b, float *c, int n)
{
    for (int i = 0; i < n; i++)
    {
        c[i] = a[i] + b[i];
    }
    return;
}

int main()
{
    float *a, *b, *c;
    int n = 1e9; // n = 1 billion
    size_t size = n * sizeof(float);
    a = (float *)malloc(size);
    b = (float *)malloc(size);
    c = (float *)malloc(size);

    auto start = std::chrono::high_resolution_clock::now(); // Start the timer

    for (int i = 0; i < n; i++)
    {
        a[i] = i;
        b[i] = i;
    }

    addVectors(a, b, c, n);
    auto end = std::chrono::high_resolution_clock::now(); // Stop the timer

    std::chrono::duration<double> diff = end - start;

    std::cout << n / 1e9 << " billion elements took : " << diff.count() << " seconds" << std::endl;
    std::cout << "Result of 10 numbers in c[] : " << std::endl;
    for (int i = 0; i < 10; i++)
        std::cout << c[i] << " ";
    std::cout << std::endl;

    free(a);
    free(b);
    free(c);

    return 0;
}