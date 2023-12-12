#include <iostream>
#include <algorithm>
#include <chrono>
#include <vector>
#include <string>
using namespace std;


const int MEMBER_COUNT = 6;

static inline int ranDOM( const int size ) {
    srand( (unsigned)time( NULL ) );
    return (rand()) % size;
}

int main() {

    int count = 0;
    int random;
    vector<string> vec = { "Elias", "Arvid", "Emil", "Love", "Theodor", "Karl" };

    while (true) {

        if (!vec.size()) break;

        random = ranDOM( vec.size() );
        cout << vec[random] << " ";

        vec.erase( vec.begin() + random );
        if (++count % 2 == 0) cout << "\n";
    }



    return 0;
}

//#pragma GCC optimize("Ofast,inline")
//#pragma GCC optimize ("unroll-loops")
//#pragma GCC optimize("O3")