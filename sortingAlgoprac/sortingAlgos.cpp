#include <iostream>
#include "sortingAlgos.h"

/*void sortingAlgos:: (){
}
void sortingAlgos:: (){
}
void sortingAlgos:: (){
}
void sortingAlgos:: (){
}//unimplemented */
void sortingAlgos:: mergSort(vector<string> & list)
{
	vector<string> listR;

	vector<string> listL;
	int mid = list.size();


	if(list.size()>2){

	for (int i=0;i<mid;i++)
	{
		listL.push_back(list[i]);
	}	
	for(int i = mid+1;i<list.size();i++)
	{
		listL.push_back(list[i]);
	}
		mergSort(listL);
		mergSort(listR);

	}
	else
	{
		merg(list,listL,listR);
	}
} 
void sortingAlgos::merg (vector<string> &list, vector<string>listL, vector<string> listR)
{
	int k=0; // left side
	int l=0; // right side
	int i = 0; //list itirator 

		
		if(listL[k].size()>listR[l].size())
		{
			list[i] = listL[k];
			k++;
		}else
		{
			list[i] = listR[l];
			l++;
		}
		



	

}






