public class ShellSort {

    public static void doShellSort(Comparable[] array){
        if(array.length<2) return;
        int gap = array.length/2;

        while (gap!=0){
            insertionSortWithGap(array,gap);
            gap/=2;
        }
    }

    private static void insertionSortWithGap(Comparable[] array, int gap) {
        int firstUnsortedIndex = gap;
        while (firstUnsortedIndex< array.length){

            insertElement(array,firstUnsortedIndex, gap);
            firstUnsortedIndex++;
        }
    }

    private static void insertElement(Comparable[] array, int firstUnsortedIndex, int gap) {
        int lastSwappedPlace = firstUnsortedIndex;
        Comparable data = array[firstUnsortedIndex];
        for(int i = firstUnsortedIndex -gap; i>=0;i-=gap){
            if(array[i].compareTo(data)>0){
                array[i+gap] = array[i];
                lastSwappedPlace = i;
            }else {
                break;
            }
        }
        array[lastSwappedPlace] = data;
    }
}
