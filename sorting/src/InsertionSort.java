public class InsertionSort {

    public static void doInsertionSort(Comparable[] array){
        if(array.length<2) return;
        int firstUnsortedIndex = 1;
        while (firstUnsortedIndex< array.length){

            insertElement(array,firstUnsortedIndex);
            firstUnsortedIndex++;
        }
    }

    private static void insertElement(Comparable[] array, int firstUnsortedIndex) {
        int lastSwappedPlace = firstUnsortedIndex;
        Comparable data = array[firstUnsortedIndex];
        for(int i = firstUnsortedIndex -1; i>=0;i--){
            if(array[i].compareTo(data)>0){
                array[i+1] = array[i];
                lastSwappedPlace = i;
            }else {
                break;
            }
        }
        array[lastSwappedPlace] = data;
    }
}
