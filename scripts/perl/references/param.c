#include <stdio.h>

void say( int [], int );

int main() {

    int  array[3] = { 1, 2, 3 };
    int  number   = 5;
   
    say( array, number );
}

void say( int arr[], int num )  {

    int i;
    
    for ( i = 0; i < sizeof( arr ); i++ ){
        printf( "%d\n",  arr[i] );
    }

    printf( "\n%d\n", num );
}

