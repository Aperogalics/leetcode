public class Main {

    public static void main(String[] args) {
        int[] arr = new int[]{20, 35, -15, 7, 55, 1, -22};
        //BubbleSort.doBubbleSort(arr);
        //SelectionSort.doSelectionSort(arr);
        //InsertionSort.doInsertionSort(arr);
        //ShellSort.doShellSort(arr);
        //MergeSort.doMergeSort(arr);
        //QuickSort.doQuickSort(arr);
        //arr = new int[]{2,5,9,8,2,8,7,12,4,3};
        //CountingSort.doCountingSort(arr);
        arr = new int[]{4725, 4586, 1330, 8792, 1594, 5729};
        RadixSort.doRadixSort(arr,10, 4);
        for (int a : arr)
            System.out.println(a);
    }
}
