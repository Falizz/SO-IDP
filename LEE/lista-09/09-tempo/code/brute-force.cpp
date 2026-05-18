#include <bits/stdc++.h>
#define size 19

using namespace std;

int main (void) {

    string caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";

    for (int i = 0; i < caracteres.length(); i++){
        char c = caracteres[i];
        cout << c;
        for (int j = 0; j < size-1; j++){
            cout << "A";
        }
        cout << endl;
    }

    return 0;
}