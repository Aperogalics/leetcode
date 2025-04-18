public class BubbleSort {


    public static void doBubbleSort(Comparable[] array){

        int lastUnsortedIndex = array.length-1;
        while(lastUnsortedIndex>0){
            bubbleUp(array, lastUnsortedIndex);
            lastUnsortedIndex--;
        }
    }

    private static void bubbleUp(Comparable[] array, int lastUnsortedIndex) {
        for (int i = 0; i< lastUnsortedIndex; i++){
            int compared = array[i].compareTo(array[i + 1]);
            if(compared>0){
                swap(array,i,i+1);
            }
        }
    }

    private static void swap(Comparable[] arr, int firstIndex, int secondIndex){
        Comparable<?> temp = arr[firstIndex];
        arr[firstIndex] = arr[secondIndex];
        arr[secondIndex] = temp;
    }
}
