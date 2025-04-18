public class RadixSort {

    public static void doRadixSort(int[] arr, int radix, int width) {
        for (int position = 0; position < width; position++) {
            doSingleRadixSort(arr, radix, position);
        }
    }

    private static void doSingleRadixSort(int[] arr, int radix, int positionFromRight) {
        int size = arr.length;
        int[] stableCountArr = new int[radix];

        for (int a : arr) {
            int digit = getDigitAtPosition(a, positionFromRight, radix);
            stableCountArr[digit]++;
        }
        //Converting to a sum array for changing just count to total positions occupied
        for(int i = 1; i<stableCountArr.length;i++){
            stableCountArr[i] += stableCountArr[i-1];
        }

        int[] tempArr = new int[arr.length];

        //Reverse traversing to preserve the ordering
        for(int i = tempArr.length-1; i>=0; i--){
            int digitAtPosition = getDigitAtPosition(arr[i], positionFromRight, radix);
            int positionInTempArray = --stableCountArr[digitAtPosition];
            tempArr[positionInTempArray] = arr[i];
        }

        for (int i = 0 ; i<arr.length ; i++){
            arr[i] = tempArr[i];
        }

    }

    private static int getDigitAtPosition(int a, int positionFromRight, int radix) {
        /*
            let a  = 98765;
            positionFromRight = 3;
            10^3 = 1000
            a/1000 = 987
            987 % 10 = 7;
         */
        return (a / (int) Math.pow(radix, positionFromRight)) % radix;
    }
}
