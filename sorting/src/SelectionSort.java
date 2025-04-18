public class SelectionSort {


    public static void doSelectionSort(Comparable[] array){

        int lastUnsortedIndex = array.length-1;
        while(lastUnsortedIndex>0){
            selectAndReplace(array, lastUnsortedIndex);
            lastUnsortedIndex--;
        }
    }

    private static void selectAndReplace(Comparable[] array, int lastUnsortedIndex) {
        int largestValueIndex = 0;
        for (int i = 1; i< lastUnsortedIndex; i++){
            int compared = array[i].compareTo(array[largestValueIndex]);
            if(compared>0){
                largestValueIndex = i;
            }
        }
        swap(array,largestValueIndex,lastUnsortedIndex);
    }

    private static void swap(Comparable[] arr, int firstIndex, int secondIndex){
        Comparable<?> temp = arr[firstIndex];
        arr[firstIndex] = arr[secondIndex];
        arr[secondIndex] = temp;
    }
}
