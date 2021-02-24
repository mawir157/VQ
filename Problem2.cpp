#include <algorithm> // sort, transform
#include <cctype>    // tolower
#include <iostream>  // cout

void stringFormat(std::string& s, const bool caseSensitive=false)
{
	if (!caseSensitive)
	{
		std::transform(s.begin(), s.end(), s.begin(),
		               [](unsigned char c){ return std::tolower(c); });
	}
	std::sort(s.begin(), s.end());

	return;
}

int main (int argc, char **argv)
{
  if (argc != 3)
  {
    std::cout << "invalid options" << std::endl;
    std::cout << "[Usage] ./angaram [word 1] [word 2]" << std::endl;
    return -1;
  }

  std::string str1 = argv[1];
  std::string str2 = argv[2];

  if (str1.size() != str2.size())
  {
		std::cout << "0" << std::endl;
  	return 0;
  }

  stringFormat(str1);
  stringFormat(str2);

  if (str1 == str2)
  {
  	std::cout << "1" << std::endl;
  	return 1;
  }
  else
  {
  	std::cout << "0" << std::endl;
  	return 0;
  }
}
