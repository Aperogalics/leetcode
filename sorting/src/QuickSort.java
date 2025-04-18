public class QuickSort {

    public static void doQuickSort(Comparable[] array) {
        if (array.length < 2) return;
        pivotAndSort(array, 0, array.length);
        //divide
        //merge
    }

    private static void pivotAndSort(Comparable[] array, int beginIndex, int endIndex) {
        //Base Condition
        if (endIndex - beginIndex < 2) {
            return;
        }

        //partition and get Pivot Index
        int pivotIndex = partition(array, beginIndex, endIndex);

        pivotAndSort(array, beginIndex, pivotIndex);
        pivotAndSort(array, pivotIndex+1, endIndex);

    }

    private static int partition(Comparable[] array, int beginIndex, int endIndex) {
        Comparable pivot = array[beginIndex];

        int i = beginIndex;
        int j = endIndex;

        while (i<j){
            //empty traversal for j to find first less value than pivot
            while (i<j && array[--j].compareTo(pivot)>0);
            if(i<j){
                array[i] = array[j];
            }
            //empty traversal for j to find first less value than pivot
            while (i<j && array[++i].compareTo(pivot)<0);
            if(i<j){
                array[j] = array[i];
            }
        }
        array[j] = pivot;
        return j;
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
