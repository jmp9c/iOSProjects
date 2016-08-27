//
//  main.cpp
//  Ten-ThousandAndFirstPrime
//
//  Created by John Peden on 5/30/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

#include <iostream>
#include <math.h>
#include <list>
using namespace std;

int main(int argc, const char * argv[]) {
  // insert code here...
  
  /* Variable Declaration */
  int n = 10001; // Number to find primes up to
  list<int> possiblePrimes;
  list<int>::const_iterator iterator;
  
//  for (int i = 0; i < pow(n, 2); i++) {
//    if (i % 2 != 0) {
//      possiblePrimes.push_back(i);
//    }
//  }
//  
//  for (iterator = possiblePrimes.begin(); iterator != possiblePrimes.end(); ++iterator) {
//    cout << *iterator << endl;
//  }
//  
  
  for (int i = 0; i < 10001;) {
    if (i % 2 != 0) {
      <#statements#>
    }
  }

    return 0;
}
