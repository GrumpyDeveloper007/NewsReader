// sqrt.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"

void SQRT ( void )

/*
  This program estimates the square root of a number.
*/

{
  float a;
  int i;
  float x;

  a = 400;

  x = 1.0;

  for ( i = 0; i < 10; i++ ) {

    printf ( "x = %f\n", x );
    x = ( x + ( a / x ) ) / 2.0;

  }

  printf ( "The estimated square root is %f\n", x );
  printf ( "Check: x * x = %f\n", x * x );

  return;
}


int main(int argc, char* argv[])
{
	printf("Hello World!\n");

SQRT();

	return 0;
}

