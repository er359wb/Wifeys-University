# Linked list case study — slides, plus the teacher's code

Source: `construction_of_linked_list.pdf`, 6 slides on one page, received
2026-11-16, plus code and notes Wifey pasted the same day. Syllabus item 1.7.
**The PDF itself is not committed**: every slide carries the institution's emblem
in the corner, and this repository is public. This transcription is the only record.

## Slides

**Comprehensive Examples — Linked list.** A linked list is a data structure
consisting of a group of nodes which together represent a sequence. Diagram, with
addresses above the boxes:

```
head [   | 1249 ] -> 1249 [ A | 1356 ] -> 1356 [ B | 1475 ] -> 1475 [ C | 1021 ] -> 1021 [ D | NULL ]
```

The first box, `head`, has an **empty data part** and holds the address of the first
data node. The data items need not be stored contiguously in memory or on disk.
Linked lists are among the simplest and most common data structures; they can implement
other abstract data types, including stacks and queues (the slide is cut off there).

**Benefit over an array.** List elements can easily be inserted or removed without
reallocation or reorganization of the entire structure. Insertion and removal can be
done at any point, with a constant number of operations if the link previous to the one
being added or removed is maintained during traversal.

**Basic concepts.**

- Singly linked lists contain nodes which have a data field as well as a `next` field,
  which points to the next node.
- An empty list is a list that contains no data records.
- The **head pointer** is a variable which always points to the first node in the list,
  or is `null` for an empty list.
- The field of each node that holds the address of the next node is the *next link* or
  *next pointer*. The remaining fields are the data, information, value, cargo or
  payload fields.
- The **tail** is the last node; its next pointer should be `NULL`.

**Analogy.** Post office boxes: the boxes are the elements or nodes, the keys are the
pointers, the book is the data. The key given to Bob is the head pointer, those stored
in the boxes are the next pointers.

**Our node has two fields:** `int data;` and `Node *next;`, plus a variable `head`
which always points to the first node, or is null for an empty list.

```cpp
class Node
{
    int data;          //data
    Node *next;        //next pointer
public:
    Node(int d=0){ data=d; next=NULL; }
    int GetData() const { return data; }
    void SetData(int d){ data=d; }
    Node * GetNext() const { return next;}
    void SetNext(Node *node){ next = node; }
};
```

## The teacher's `linkedlist` code (pasted by Wifey)

```cpp
class node{
	int data;
	node* next;
	public:
		node(){next=NULL;}
	       node(int d, node *p=NULL){
	    	       data= d;
			next= p;  }
		void setnext(node *p){ next=p;}
		int  getdata(){ return data; }
		node *getnext(){return next; }
		void setdata(int d){ data=d;}
};
class linkedlist{
	node *head;
	public:
		linkedlist(){ head=new node; }
		linkedlist(int d){
			head=new node;
			node *p=new node(d);
			head->setnext(p);
		}
		void append(int d){
			  node *q;
			  q=new node(d);
			node *p=head;
			while(p->getnext()!=NULL)
			     p=p->getnext();   // move p
			p->setnext(q);
		}
		void display(){
			node *p;
			p=head->getnext();
			while(p!=NULL){
			   cout<<p->getdata()<<' ';
			   p=p->getnext();
			}
			cout<<endl;
		}
};
```

### Insertion (notes pasted with the code)

Follow three steps to insert a given number `d` into a linked list **in ascending order**:

1. Create a new node
2. Determine the position by comparison
3. Insert the new node

### Deletion

Follow two steps to remove a node containing data `d` from a nonempty linked list:

1. Find out the corresponding node by comparison
2. Remove the current node

## Flagged

1. **The slide's text and the slide's diagram disagree about the empty list.** The text
   says the head pointer is `null` for an empty list; the diagram, and the teacher's
   own constructor `head=new node;`, use an **empty head node**, so an empty list is one
   node whose `next` is `NULL`. The teacher's code is what the `Linkedlist` task
   (`Linkedlist_Node_task.md`) follows. This also settles the earlier question of
   whether the head node carries a letter: it does not.
2. **Two spellings of the same class**: the slide uses `Node`, `GetNext`, `SetNext`;
   the pasted code uses `node`, `getnext`, `setnext`. The earlier task sheet uses
   `Node`, `getNext`, `setNext`. Case matters in C++.
3. **Insertion and deletion are described in steps only; no code was given.** They are
   likely the next exercises. Ascending-order insertion needs the node **before** the
   position, not the node at it, so that it can be linked.
4. The `display()` above is the same shape as the one Wifey wrote for `Linkedlist`.

## Verified

The pasted `node` and `linkedlist` classes compiled with `g++ -Wall` (no warnings);
`linkedlist L(10); L.append(20); L.append(30); L.display();` prints `10 20 30` and
the empty list prints a blank line.
