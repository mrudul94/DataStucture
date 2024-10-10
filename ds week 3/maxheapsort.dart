class MaxHeap {
  List<int> heap;

  MaxHeap(List<int> elements) : heap = List.from(elements) {
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
    int largest = i;
    int left = leftChild(i);
    int right = rightChild(i);

    if (left < heap.length && heap[left] > heap[largest]) {
      largest = left;
    }

    if (right < heap.length && heap[right] > heap[largest]) {
      largest = right;
    }

    if (largest != i) {
      _swap(i, largest);
      heapify(largest);
    }
  }

  void _swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }

  void sort() {
    int size = heap.length;

    for (int i = size - 1; i > 0; i--) {
      // Swap the root (maximum) with the last element
      _swap(0, i);
      // Reduce the heap size and heapify the root
      List<int> subHeap = heap.sublist(0, i);
      MaxHeap reducedMaxHeap = MaxHeap(subHeap);
      reducedMaxHeap.buildHeap();
      heap.setRange(0, i, reducedMaxHeap.heap);
    }
  }
}

void main() {
  List<int> elements = [4, 10, 3, 5, 1];
  MaxHeap maxHeap = MaxHeap(elements); // Create a new MaxHeap instance

  print('Original array: $elements');
  maxHeap.sort();
  print('Sorted array: ${maxHeap.heap}');
}
