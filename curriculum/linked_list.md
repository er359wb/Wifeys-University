# Singly linked list with a head node — the written description and operation list

Source: `linked_list.docx` (upload name `linked_list1.docx`), received 2026-11-16.
Reformatted companion — read this, not the `.docx`. Syllabus item 1.7. It is the
specification behind the earlier skeleton task, `Linkedlist_Node_task.md`.

## I. What is a singly linked list

A singly linked list is a linear data structure with chained storage. It consists of a
series of **nodes**, each with two parts: a **data field** and a **pointer field**
holding the address of the next node. The pointer field of the last node is usually
`NULL`, marking the end.

**"With a head node"** means that before the first node that actually stores data, an
extra **head node that does not store valid data** is added; its pointer field points
to the first data node. The advantage: insertion and deletion are handled uniformly
whether at the head or in the middle, with no special case for "inserting before the
first node" or "deleting the first node".

Main advantages: inserting or deleting needs no moving of many elements as with
arrays, only the pointers of the nodes concerned; it needs no contiguous memory; nodes
are allocated as needed, so the length is not limited by pre-allocated space.

## II. Terminology

| Term | Meaning |
|---|---|
| Node | basic unit: a data field and a pointer field |
| Data field (`data`) | stores a data element |
| Pointer field (`next`) | stores the address of the next node |
| Head node | special first node that stores no valid data; its pointer points to the first data node |
| Head pointer | pointer to the **head node**; the entry point to the whole list |
| First element node | the first node that actually stores data, the one the head node points to |
| Tail node | the last node; its pointer field is `NULL` |
| Empty list | for a list with a head node: **the head node's pointer field is `NULL`** |

## III. Basic operations of the `LinkedList` class

The class encapsulates the data (the head pointer) and the operations (member
functions), so users only call methods through an object, without caring about the
pointers inside. For a list with a head node the operations are:

| Operation | What it does |
|---|---|
| Constructor | creates the head node and initializes an empty list |
| `isEmpty()` | whether the list is empty (whether the head node's next is `NULL`) |
| `print()` | outputs the data of each node from head to tail |
| `getLength()` | traverses the list and returns the number of data nodes |
| `get(pos)` | returns the data of the `pos`-th node |
| `find(value)` | finds the node whose value is `value`, returns its address |
| `find(pos)` | returns the address of the `pos`-th position |
| `insertAtHead(value)` | inserts a new node before the first element node |
| `insertAtTail(value)` | appends a new node at the end |
| `insertAt(pos, value)` | inserts a new node at the `pos`-th position |
| `removeAt(pos)` | deletes the `pos`-th node and releases its memory |
| `clear()` | deletes all data nodes, restoring the empty state |
| Destructor | releases the memory of all nodes, to prevent memory leaks |

## Points that are not stated — flagged

1. **No signatures, no `main`, and no expected output are given.** The operations are
   listed by name and purpose only; the exact return types are not fixed. `find(value)`
   "returns its address", so it returns a node pointer; what it returns when the value
   is absent is not said (the earlier `MyString::find` sheet used `NULL`).
2. **Positions are not defined as 0-based or 1-based.** "The `pos`-th node" is
   ambiguous; the first element node would be position 1 or position 0.
3. **The head node is not counted** by `getLength()`: "the number of data nodes".
4. **The destructor is part of the specification**, which matches the lecture rule
   that a class that allocates with `new` needs an explicit destructor (see
   `Chapter_I_objects_and_classes.md`). It is the first place in the course where a
   destructor does real work: it has to walk the chain and `delete` every node,
   including the head node.
5. This sheet confirms, in writing, what the teacher's drawing and code already showed:
   **an empty list is one head node whose `next` is `NULL`**, not a null head pointer.
