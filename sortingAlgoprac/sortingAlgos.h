#ifndef sortingAlgos_H
#define sortingAlgos_H
#include <vector>
#include <string>
using std::string;
using std::vector;



class sortingAlgos 
{
	protected:
	vector<string> List;
	


	public:
	

	void addList();
	void getList();
	void selectionSort(vector<string>& list);
	void insertionSort(vector<string>& list);
	void mergSort(vector<string> & list);
	void merg(vector<string> & list,vector<string> listL, vector<string> listR);


};

#endif
