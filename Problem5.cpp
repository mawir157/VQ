#include <algorithm> // sort
#include <iostream>  // cout
#include <vector>    // vector

std::vector<uint64_t> linearGenerator(const uint64_t a,
                                      const uint64_t b,
                                      const uint64_t p)
{
    std::vector<uint64_t> vec;
    vec.reserve(20000000);
    for (uint64_t i = 0; i < 20000000; ++i)
    {
        vec.push_back((a*i + b) % p);
    }

    return vec;
}

uint64_t sumSmallestN(const size_t n, std::vector<uint64_t>& vec)
{
    std::sort(vec.begin(), vec.end());
    uint64_t total = 0;
    for (int i = 0; i < n; ++i)
    {
        total += vec[i];
    }

    return total;
}

void comparer(const uint64_t v1, uint64_t v2, uint64_t v3)
{
    if (v1 < 5000)
    {
        std::cout << "Array 1:" << v1 << std::endl;
    }
    else if (v1 < 10000)
    {
        std::cout << "Array 2:" << v2 << std::endl;
    }
    else if (v1 < 20000)
    {
        std::cout << "Array 3:" << v3 << std::endl;
    }
    else
    {
        std::cout << "Array Error" << std::endl;
    }

    return;
}

void wrapper(std::vector<uint64_t>& vec1,
               std::vector<uint64_t>& vec2,
               std::vector<uint64_t>& vec3)
{
    auto value1 = sumSmallestN(50, vec1);
    auto value2 = sumSmallestN(50, vec2);
    auto value3 = sumSmallestN(50, vec3);

    return comparer(value1, value2, value3);
}

int main(int argc, char *argv[])
{   
    auto vector1 = linearGenerator(132953, 514229, 5195977);
    auto vector2 = linearGenerator(790879, 324469, 6860989);
    auto vector3 = linearGenerator(222527, 920209, 9824429);

    wrapper(vector1, vector2, vector3);

    return 0;
}
