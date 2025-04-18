public class CountingSort {

    public static void doCountingSort(int[] arr) {
        int smallestValue = getSmallestValue(arr);
        int largestValue = getLargestValue(arr);

        if (smallestValue < 0) {
            System.out.println("Only work for positive numbers");
            return;
        }

        int[] countingArr = new int[largestValue - smallestValue + 1];

        for (int j : arr) {
            countingArr[j - smallestValue]++;
        }
        int k=0;
        for (int i = 0; i < countingArr.length; i++) {
            int valueCount = countingArr[i];
            int value = i+smallestValue;
            while (valueCount-->0){
                arr[k++] = value;
            }
        }
    }

    private static int getLargestValue(int[] arr) {
        int maxValue = Integer.MIN_VALUE;
        for (int a : arr) {
            if (a > maxValue) {
                maxValue = a;
            }
        }
        return maxValue;
    }

    private static int getSmallestValue(int[] arr) {
        int minValue = Integer.MAX_VALUE;
        for (int a : arr) {
            if (a < minValue) {
                minValue = a;
            }
        }
        return minValue;
    }
}
