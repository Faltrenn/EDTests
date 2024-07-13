#include "include/teste.h"
#include <stdio.h>

void swap_c(int *a, int *b) {
    int m;
    m = *a;
    *a = *b;
    *b = m;
}

unsigned int partition_c(int *v, unsigned int s, unsigned int e) {
    unsigned int d = s;

    for (int i = s; i <= (e - 1); i++) {
        if (v[i] <= v[e]) {
            swap_c(&v[d], &v[i]);
            d = d + 1;
        }
    }
    swap_c(&v[d], &v[e]);
    return d;
}

void quick_sort_c(int *v, int s, int e) {
    unsigned int p;

    if (s < e) {
        p = partition_c(v, s, e);

        quick_sort_c(v, s, p - 1);
        quick_sort_c(v, p + 1, e);
    }
}
