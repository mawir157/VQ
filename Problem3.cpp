#include <algorithm> // sort
#include <iostream>  // cout
#include <fstream>   // ifstream
#include <vector>    // vector
#include <map>       // map

int main(int argc, char *argv[])
{   
    std::string filePath = "";
    if (argc > 1)
    {
        filePath = argv[1];
    }
    else
    {
        std::cout << "Supply a file path\n";
        return -1;
    }

    std::string line;
    std::map<int64_t, size_t> seen;

    std::ifstream data_file(filePath);

    while(getline(data_file, line))
    {
        int value = 0;
        try
        { 
            value = std::stoi(line);
        } 
        catch (const std::exception&)
        {
            std::cout << "Invalid line in input file." << std::endl;
            return -1;
        }

        seen[value] += 1;
    }

    data_file.close();

    // copy the keys and values in the map, into a vector of pairs
    std::vector<std::pair<int64_t, size_t>> zip;
    for (auto const &p: seen) {
        zip.push_back(std::make_pair(p.first, p.second));
    } 

    // then sort the vector of pairs by the second element
    std::sort(zip.begin(), zip.end(), 
              [](const auto& i, const auto& j) { return i.second > j.second; });

    // make sure we don't run past the end of the vector when there are fewer
    // than 4 distinct values
    size_t m = (zip.size() < 4) ? zip.size() : 4;
    for (size_t i = 0; i < m; ++i)
    {
        std::cout << zip[i].first << std::endl;
    }

    return 0;
}
