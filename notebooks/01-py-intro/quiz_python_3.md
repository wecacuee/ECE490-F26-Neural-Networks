Quiz title: Python 3 PyTorch Quiz
Quiz description: A quiz covering PyTorch tensors, indexing, slicing, reshaping, broadcasting, and tensor operations.


Title: tensor Meaning
Points: 1
1. What is the output of `type(torch.Tensor([1, 2]))`
*a) `<class 'torch.tensor'>`
b) `<class 'torch.ndtensor'>`
c) `<class 'torch.matrix'>`
d) `<class 'torch.array'>`

Title: Vector vs Matrix
Points: 1
2. In PyTorch, what is the difference between a vector and a matrix?
a) Vectors use integers, matrices use floats
*b) A vector is 1-dimensional, a matrix is 2-dimensional
c) Vectors are mutable, matrices are immutable
d) There is no difference

Title: PyTorch Indexing Start
Points: 1
3. What does indexing in PyTorch start at?
*a) 0
b) 1
c) -1
d) It depends on the tensor type

Title: Array Concatenation
Points: 1
4. Which function is used to join two tensors along an existing axis?
a) torch.join()
b) torch.merge()
*c) torch.cat()
d) torch.append()

Title: Reshape Function
Points: 1
5. What does `tensor.reshape()` do?
a) Changes the data type of the tensor
*b) Gives a new shape to an tensor without changing its data
c) Sorts the tensor elements
d) Removes duplicate elements

Title: Reshape Requirement
Points: 1
6. When reshaping an tensor, what requirement must be satisfied?
a) The new shape must have fewer elements
*b) The total number of elements must remain the same
c) The new shape must have more dimensions
d) The tensor must be 1-dimensional first

Title: torch.newaxis Purpose
Points: 1
7. What does `torch.newaxis` do?
*a) Increases the dimensions of an tensor by one
b) Creates a new tensor
c) Adds new elements to an tensor
d) Creates a copy of the tensor

Title: torch.newaxis Implementation
Points: 1
8. What is `torch.newaxis` implemented as?
a) 0
b) -1
*c) None
d) Ellipsis

Title: Squeeze Method
Points: 1
9. What does the `.squeeze()` method do?
a) Compresses the data values
*b) Removes dimensions of size 1
c) Reduces the tensor to 1D
d) Removes duplicate elements

Title: Boolean Indexing
Points: 1
10. Given `a = torch.tensor([1, 2, 3, 4, 5])`, what does `a[a < 3]` return?
a) [True, True, False, False, False]
*b) [1, 2]
c) [3, 4, 5]
d) An error

Title: Logical Operators
Points: 1
11. What do the operators `&` and `|` do when used with PyTorch boolean tensors?
a) Bitwise operations on integers
*b) Element-wise AND and OR operations
c) Concatenate tensors
d) Compare tensor shapes

Title: torch.nonzero Function
Points: 1
12. What does `torch.nonzero()` return?
a) All zero elements in an tensor
*b) The indices of non-zero elements
c) A count of non-zero elements
d) An tensor with zeros removed

Title: Ellipsis in Indexing
Points: 1
13. What does `...` (Ellipsis) do in PyTorch indexing?
*a) Expands to the number of colons needed to index all dimensions
b) Selects the last element
c) Creates a copy of the tensor
d) Raises an error

Title: View vs Copy
Points: 1
14. What is the difference between a view and a copy in PyTorch?
*a) A view shares data with the original tensor; a copy has its own data
b) A view is slower; a copy is faster
c) A view is immutable; a copy is mutable
d) There is no difference

Title: Modifying a View
Points: 1
15. What happens when you modify a view of a PyTorch tensor?
a) Only the view is modified
*b) The original tensor is also modified
c) An error is raised
d) A new tensor is created

Title: Deep Copy Method
Points: 1
16. Which method creates a deep copy of a PyTorch tensor?
a) arr.view()
b) arr.clone()
*c) arr.copy()
d) torch.duplicate(arr)

Title: Broadcasting Definition
Points: 1
17. What is broadcasting in PyTorch?
a) Sending tensors to multiple processes
*b) A mechanism that allows operations on tensors of different shapes
c) Converting tensors to different data types
d) Distributing computations across GPUs

Title: Sum Axis 0
Points: 1
18. What does `torch.sum(arr, axis=0)` do for a 2D tensor?
*a) Sums along columns (returns one value per column)
b) Sums along rows (returns one value per row)
c) Returns the total sum
d) Returns the cumulative sum

Title: Sum Axis 1
Points: 1
19. What does `torch.sum(arr, axis=1)` do for a 2D tensor?
a) Sums along columns
*b) Sums along rows (returns one value per row)
c) Returns the total sum
d) Flattens and sums

Title: vstack Function
Points: 1
22. What does `torch.vstack()` do?
a) Validates the stack
*b) Stacks tensors vertically (row-wise)
c) Creates a vector stack
d) Stacks tensors diagonally

Title: hstack Function
Points: 1
23. What does `torch.hstack()` do?
*a) Stacks tensors horizontally (column-wise)
b) Creates a hash stack
c) Stacks tensors vertically
d) Creates a heap stack

Title: Zeros Array
Points: 1
24. How do you create an tensor of all zeros with shape (3, 4)?
a) torch.tensor(0, (3, 4))
*b) torch.zeros((3, 4))
c) torch.zeros(3, 4)
d) torch.zero((3, 4))

Title: Ones Array
Points: 1
25. How do you create an tensor of all ones with shape (2, 3)?
a) torch.tensor(1, (2, 3))
*b) torch.ones((2, 3))
c) torch.ones(2, 3)
d) torch.one((2, 3))

Title: C-Order Index
Points: 1
27. In C-order (row-major), which index changes most rapidly when traversing memory?
a) The first index
*b) The last index
c) The middle index
d) All indices change at the same rate

Title: hsplit Function
Points: 1
28. What does `torch.hsplit(arr, 3)` do?
*a) Splits the tensor into 3 equal parts horizontally
b) Splits the tensor into 3 equal parts vertically
c) Removes every 3rd element
d) Creates 3 copies of the tensor

Title: Flatten Result
Points: 1
29. Given `arr = torch.tensor([[1, 2], [3, 4]])`, what does `arr.flatten()` return?
a) [[1, 2, 3, 4]]
*b) [1, 2, 3, 4]
c) [[1], [2], [3], [4]]
d) [[1, 2], [3, 4]]

