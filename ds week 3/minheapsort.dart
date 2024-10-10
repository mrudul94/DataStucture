class MinHeap {
  List<int> heap = [];

  MinHeap(List<int> elements) {
    heap = elements;
    buildHeap();
  }

  int leftChild(int i) => 2 * i + 1;
  int rightChild(int i) => 2 * i + 2;
  int parent(int i) => (i - 1) ~/ 2;

  void buildHeap() {
    for (int i = (heap.length ~/ 2) - 1; i >= 0; i--) {
      heapify(i);
    }
  }

  void heapify(int i) {
    int smallest = i;
    int left = leftChild(i);
    int right = rightChild(i);

    if (left < heap.length && heap[left] < heap[smallest]) {
      smallest = left;
    }

    if (right < heap.length && heap[right] < heap[smallest]) {
      smallest = right;
    }

    if (smallest != i) {
      _swap(i, smallest);
      heapify(smallest);
    }
  }

  void _swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }

  List<int> sort() {
    int size = heap.length;
    List<int> sorted = [];

    while (heap.isNotEmpty) {
      _swap(0, heap.length - 1);
      sorted.add(heap.removeLast());
      heapify(0);
    }

    return sorted;
  }
}

void main() {
  List<int> elements = [4, 10, 3, 5, 1];
  MinHeap minHeap = MinHeap(elements);

  print('Original array: $elements');
  List<int> sortedArray = minHeap.sort();
  print('Sorted array: $sortedArray');
}
