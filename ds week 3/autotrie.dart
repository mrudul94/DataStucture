class TrieNode {
  Map<String, TrieNode> children = {};
  bool isEndOfWord = false;
}

class Trie {
  TrieNode root = TrieNode();

  // Insert word into Trie
  void insert(String word) {
    TrieNode current = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!current.children.containsKey(char)) {
        current.children[char] = TrieNode();
      }
      current = current.children[char]!;
    }
    current.isEndOfWord = true;
  }

  // Search prefix in Trie and return the node where the prefix ends
  TrieNode? searchPrefix(String prefix) {
    TrieNode current = root;
    for (int i = 0; i < prefix.length; i++) {
      String char = prefix[i];
      if (!current.children.containsKey(char)) {
        return null;
      }
      current = current.children[char]!;
    }
    return current;
  }

  // Helper function to collect all words from the given node
  void _collectAllWords(TrieNode node, String prefix, List<String> result) {
    if (node.isEndOfWord) {
      result.add(prefix);
    }
    for (String char in node.children.keys) {
      _collectAllWords(node.children[char]!, prefix + char, result);
    }
  }

  // Get all words that start with a given prefix
  List<String> autoSuggest(String prefix) {
    TrieNode? node = searchPrefix(prefix);
    List<String> suggestions = [];
    if (node != null) {
      _collectAllWords(node, prefix, suggestions);
    }
    return suggestions;
  }
}
void main() {
  Trie trie = Trie();
  
  // Insert words into the Trie
  trie.insert("hello");
  trie.insert("helium");
  trie.insert("hey");
  trie.insert("hero");
  trie.insert("heron");
  trie.insert("heat");
  
  // Get auto-suggestions for a prefix
  List<String> suggestions = trie.autoSuggest("he");
  print(suggestions);  // Output: ['hello', 'helium', 'hey', 'hero', 'heron', 'heat']
}
