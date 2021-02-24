#include <cmath>    // ceil, floor
#include <iostream> // cout

int64_t adder(const double i1, const double i2)
{
	// find the smaller value, then round up to the nearest integer...
	int64_t lower = std::ceil(std::min(i1, i2));
	// ...then make sure we start summing from an even number
	lower += (lower % 2 != 0);
	// round down to the nearest integer for upper bound
	int64_t upper = std::floor(std::max(i1, i2));
	
	auto total = 0;
	for (int64_t i = lower; i <= upper; i += 2)
	{
		total += i;
	}

	return total;
}

int main (int argc, char **argv)
{
  if (argc != 3)
  {
    std::cout << "invalid options" << std::endl;
    std::cout << "[Usage] ./adder [number 1] [number 2]" << std::endl;
    return -1;
  }

	double arg_1, arg_2;
	try
	{ 
		arg_1 = std::stod(argv[1]);
	} 
	catch (const std::exception&)
	{
		std::cout << "Cannot parse argument 1" << std::endl;
		return -1;
	}

	try
	{ 
		arg_2 = std::stod(argv[2]);
	} 
	catch (const std::exception&)
	{
		std::cout << "Cannot parse argument 2" << std::endl;
		return -1;
	}

  std::cout << adder(arg_1, arg_2) << std::endl;

  return 0;
}
