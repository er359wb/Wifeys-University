# Linked list task — `Node` and `Linkedlist`

Source: code pasted by Wifey on 2026-11-05 (the teacher's skeleton). Not a
file, so there is no original beside this note.

## The skeleton, verbatim

```cpp
#include <iostream>
using namespace std;
class Node{
	char data;
	Node *next;
	public:
		//please complete definition and add neccessary member functions
		Node(){ next=NULL;}
		Node(char d){data=d,next=NULL;} // create a node holding character d
		void setNext(Node* p){next=p;}
		Node* getNext(){return next;}
		char getData(){return data;}
};
class Linkedlist{
	Node *Head;  // every linkedlist has a  pointer Head which points to head node
	public:
		Linkedlist(); //create an empty linked list(which has only a head node )
		Linkedlist(char w,char d); //create a linkedlist holding w &d
		void display();
		int length();
};
int main(){
	Linkedlist L1,L2('A','B');
    L1.display();  // output: Empty
    L2.display(); //  output : AB
    cout<<"there are "<<L2.length()<<"nodes in L2";
    return 0;
}
```

## What has to be written

The bodies of the four `Linkedlist` members: the default constructor, the
two-character constructor, `display()` and `length()`. The comment inside `Node`
says to "complete definition and add necessary member functions"; the `Node` shown
already has everything these four need.

## Points the task leaves open — flagged, not silently decided

1. **"Empty linked list (which has only a head node)" is ambiguous.** Read as: `Head`
   points to a **head node that carries no letter**, and the real data nodes hang
   after it. So an empty list is `Head -> [head node | NULL]`, and `L2` is
   `Head -> [head node] -> [A] -> [B] -> NULL`. The alternative reading is
   `Head == NULL` for an empty list. The first reading was used; **worth confirming
   with the teacher**.
2. **Does `length()` count the head node?** `L2` has two letters, so under the
   first reading it is 2 (head node not counted) or 3 (counted). Counting only
   the data nodes was assumed.
3. **The last output line prints `2nodes`**: the string is `"nodes in L2"` with no
   space before it, so the output is `there are 2nodes in L2`. Probably a typo, kept
   as written.
4. **Newlines are not specified.** `display()` output is shown on separate lines in
   the comments, but `main` has no `endl`. With no newline in `display()` the three
   outputs run together as `EmptyABthere are 2nodes in L2`. A newline inside
   `display()` was assumed.
5. **`Node()` leaves `data` uninitialised.** That is harmless for a head node that
   carries nothing, and is part of the given code.
6. **`data` and `next` are private**, and there are no `friend` declarations, so
   `Linkedlist` can only reach them through `getData`, `getNext`, `setNext`. That
   shapes how every function is written: `p->getNext()` instead of `p->next`.
7. **No destructor is mentioned**, so the nodes are never freed. Acceptable for this
   exercise, as in the `MyString` sheet.

## Verified against a reference

A reference of the four functions was compiled with `g++ -Wall` (no warnings) and
printed, with a newline assumed in `display()`:

```
Empty
AB
there are 2nodes in L2
```

## Concepts this task requires

- a node as an object holding a value and the address of the next node
- `Head`, a pointer that is the only way into the list
- `NULL` as the end marker
- creating a node with `new Node(...)`
- the arrow `p->getNext()`: calling a member function through a pointer
- walking the list with a pointer in a `while (p != NULL)` loop
- building the list by linking: `setNext`
