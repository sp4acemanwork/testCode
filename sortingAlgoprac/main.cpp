#include <iostream>
#include <string>
#include <vector>
#include "sortingAlgos.cpp"
#include "config.h"

using std::cout;
using std::endl;
using std::string;
using std::cin;
using std::vector;


int main(int argc, char** argv) {
    	
	sortingAlgos sort;
	vector<string> list;

	config.parse_flags(argc, argv);

	if(config.debug == true);
	bool running = true;
	while(running){

		cout << "sorting algorithms" << endl;
		cout << "Please select an option" << endl;
		cout <<"1. Add list"<<endl;
		cout <<"2. Print list"<<endl;
		cout <<"3. selection sort"<<endl;
		cout <<"4. insertion sort"<<endl;
		cout <<"5. merg sort"<<endl;
		cout << "<";
		
		string options;

		getline(cin,options);
		
		int x = stoi(options);
		bool adding = true;
		
		switch(x)
		{
		
			case 1:
				
				list.clear();
			
				while(adding)
				{
				
				cout<<"Enter a string"<<endl;
				cout<<">";
			
				getline(cin,options);
				
				if(options.length() == 0){

					adding = false;
					break;
				}
				list.push_back(options);
				options = "";
				}



			break;

			case 2:
			for(int i = 0;i<list.size();i++)
			{
				cout << list[i] << endl;
			}
			break;

			case 3:
		
			break;

			case 4:
		
			break;

			case 5:
			sort.mergSort(list);
			break;

			default:	
			     	running = false;
			break;
		}











	
	}


}
