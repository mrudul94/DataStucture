void mergeSort(List<int> arr) {
  if (arr.length <= 1) return;

  int mid = arr.length ~/ 2;
  List<int> left = arr.sublist(0, mid);
  List<int> right = arr.sublist(mid);

  mergeSort(left);
  mergeSort(right);

  merge(arr, left, right);
}

void merge(List<int> arr, List<int> left, List<int> right) {
  int leftIndex = 0;
  int rightIndex = 0;
  int arrIndex = 0;

  while (leftIndex < left.length && rightIndex < right.length) {
    if (left[leftIndex] <= right[rightIndex]) {
      arr[arrIndex++] = left[leftIndex++];
    } else {
      arr[arrIndex++] = right[rightIndex++];
    }
  }

  while (leftIndex < left.length) {
    arr[arrIndex++] = left[leftIndex++];
  }

  while (rightIndex < right.length) {
    arr[arrIndex++] = right[rightIndex++];
  }
}

void main() {
  List<int> arr = [8, 6, 5, 99, 4, 1, -98];
  mergeSort(arr);
  print(arr);
}
