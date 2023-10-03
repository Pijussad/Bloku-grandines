#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <chrono>

using namespace std;

// Apibreziame hash dydi baitais (256 bitai)
const int HASH_SIZE_BYTES = 32;

// Funkcija, kuri atlieka hash operacija su tekstu
vector<char> customHash(const string& input) {
    vector<char> hash(HASH_SIZE_BYTES, 0);
    // Einame per visus simbolius teksto
    for (char simbolis : input) {
        // Einame per visus hash baitus
        for (int i = 0; i < HASH_SIZE_BYTES; i++) {
            // Atnaujiname kiekviena hash baita naudodami bitini XOR ir poslinkio operacijas
            hash[i] = (hash[i] + simbolis + (i % 13)) ^ ((hash[i] << (i % 8)) | (hash[i] >> (8 - (i % 8))));
            hash[i] = (hash[i] + i) * 37;
            hash[i] = (hash[i] >> 4) | (hash[i] << 3);
            hash[i] = hash[i] & ((i + 1) * 77);
            hash[i] = hash[i] | ((i + 2) * 23);
            hash[i] = (hash[i] + simbolis + (i % 7)) ^ ((hash[i] << 5) | (hash[i] >> 3));
            hash[i] = hash[HASH_SIZE_BYTES-1-i]*15+hash[i];
            hash[i] = hash[HASH_SIZE_BYTES-i]*10+hash[i];
        }
    }
    return hash;
}


vector<string> readInputData(int argc, char* argv[]) {
    vector<string> lines;
    
    if (argc > 1) {
        string ivestiesFailoVardas = argv[1];
        ifstream inputFile(ivestiesFailoVardas);

        if (!inputFile.is_open()) {
            cerr << "Klaida: Nepavyko atidaryti įvesties failo." << endl;
            exit(1);
        }

        string eilute;
        while (getline(inputFile, eilute)) {
            lines.push_back(eilute);  
        }

        inputFile.close();
    } else {
        string line;
        while (true) {
            cout << "Įveskite tekstą (baigti su Ctrl+D arba Ctrl+Z): "<<endl;
            if (!getline(cin, line)) {
                break;
            }
            lines.push_back(line); 
        }
    }

    if (lines.empty()) {
        cerr << "Klaida: Tuščia įvestis." << endl;
        exit(1);
    }
    
    return lines;
}


int main(int argc, char* argv[]) {
    // Nuskaityti įvesties duomenis iš argumentų
    vector<string> lines = readInputData(argc, argv);
    auto start_time = std::chrono::high_resolution_clock::now();
    ofstream outFile("hashes2.txt");
    for (const string& ivestis : lines) {
        // Skaičiuoti maišos funkciją naudojant dabartinę eilutę (ivestis)
        vector<char> hash = customHash(ivestis);

        // Rodyti maišą heksadecimale
        //cout << "Hash: ";
        for (char baitas : hash) {
            outFile << hex << setw(2) << setfill('0') << (int)(unsigned char)baitas;
        }
        outFile << dec << endl;
    }
    auto end_time = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end_time - start_time);
    // Rodyti hashavimo laiką
    cout << "Hashavimo laikas: " << duration.count() << " mikrosekundės" << endl;
    return 0;
}
