#include <fstream>
#include <iostream>
#include <string>

using namespace std;


const string PATH = "godishalsband_kodgolf.cpp";



int main() {

    int ch_count = 0;

    ifstream fr_user( PATH );
    if (!fr_user.is_open()) { printf( "File open error.\n" ); return 0; }

    string str;
    while (getline( fr_user, str )) {
        for (char ch : str) {
            if (ch != ' ') ++ch_count;
        }
    }

    fr_user.close();


    cout << ch_count;
}