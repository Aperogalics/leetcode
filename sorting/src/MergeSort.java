public class MergeSort {

    public static void doMergeSort(Comparable[] array) {
        if (array.length < 2) return;
        divideAndMerge(array, 0, array.length);
        //divide
        //merge
    }

    private static void divideAndMerge(Comparable[] array, int beginIndex, int endIndex) {
        //Base Condition
        if (endIndex - beginIndex < 2) {
            return;
        }

        //Divide the array into 2 sub-arrays
        int midIndex = (endIndex + beginIndex) / 2;
        divideAndMerge(array, 0, midIndex);
        divideAndMerge(array, midIndex, endIndex);

        //Merge 2 sorted sub-arrays
        mergeAndSort(array, beginIndex, endIndex, midIndex);

    }

    private static void mergeAndSort(Comparable[] array, int beginIndex, int endIndex, int midIndex) {
        Comparable[] tempArr = new Comparable[endIndex - beginIndex];
        int i =beginIndex, j = midIndex, k = 0;
        while (i < midIndex && j < endIndex){
            if (array[i].compareTo(array[j]) > 0) {
                tempArr[k++] = array[j++];
            } else {
                tempArr[k++] = array[i++];
            }
        }
        while (i < midIndex) {
            tempArr[k++] = array[i++];
        }
        while (j < endIndex) {
            tempArr[k++] = array[j++];
        }
        k = 0;
        for (int i1 = beginIndex; i1 < beginIndex+tempArr.length; i1++) {
            array[i1] = tempArr[k++];
        }
    }

}
