

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void printArray(int *array, size_t size) {
	int intSize = sizeof(int);
	int numElements = (int)size/intSize;
	
	for (int i = 0; i < numElements; i++) {
		printf("%i ", array[i]);
	}
}

int *concat(int *first, size_t firstSize,
			int *second, size_t secondSize)
{
	printf("joining: ");
	printArray(first, firstSize);
	printf(" with: ");
	printArray(second, secondSize);
	printf("\n");
	
	if (firstSize == 0) return second;
	if (secondSize == 0) return first;
    
	int *joined = malloc(firstSize+secondSize);
	memcpy(joined, first, firstSize);
	memcpy(joined+(firstSize/sizeof(int)), second, secondSize);
	return joined;
}

int *concat3(int *first, size_t firstSize,
			 int middle,
			 int *last, size_t lastSize)
{
	int middleArray[1] = {middle};
	int *segment1 = concat(first, firstSize, middleArray, 1);
	return concat(segment1, firstSize+1, last, lastSize);
}

int *quickSort(int *array, int length) {
	printf("array: ");
	printArray(array, length * sizeof(int));
	printf("\n");
	if (length == 0) {
		printf("returning 0\n");
		int *a = malloc(0);
		return a;
	} else if (length == 1) {
		printf("returning: %i\n", array[0]);
		return array;
	}
	
	// Choose partition
	int partI = length/2;
	int part = array[partI];
	
	// Everything smaller in 'less' everything bigger in 'more'
	int less[length];
	int more[length];
	int lessI = 0;
	int moreI = 0;
	for (int i = 0; i < length; i++) {
		if (i == partI) continue;
		
		int num = array[i];
		if (num <= part) {
			less[lessI] = num;
			lessI++;
		} else {
			more[moreI] = num;
			moreI++;
		}
	}
	
	printf("less: ");
	printArray(less, length * sizeof(int));
	printf("\nlessI: %i\n", lessI);
	
	printf("part: %i\n", part);
	
	printf("more: ");
	printArray(more, length * sizeof(int));
	printf("\nmoreI: %i\n", moreI);
	
	// return concatenate(quicksort('less'), list('pivot'), quicksort('greater')) // two recursive calls
    //	return 0;
	int *lessSorted = quickSort(less, lessI);
	int *moreSorted = quickSort(more, moreI);
	return concat3(lessSorted, lessI,
				   part,
				   moreSorted, moreI);
}
















