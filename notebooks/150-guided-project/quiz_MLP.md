Quiz title: MLP Guided Project Quiz
Quiz description: A quiz covering MLP architecture in PyTorch, MNIST dataset loading, DataLoader, CrossEntropyLoss, SGD with momentum, training and validation loops, and model evaluation.

Title: MNIST Batch Shape
Points: 5
1. After loading MNIST images via `torchvision.datasets.MNIST` with `ToTensor()` and creating a `DataLoader` with `batch_size=64`, what is the shape of one batch of images `X`?

a) `torch.Size([64, 784])`
b) `torch.Size([64, 28, 28])`
*c) `torch.Size([64, 1, 28, 28])`
d) `torch.Size([64, 3, 28, 28])`

Title: Flatten Layer Purpose
Points: 5
2. In the `MLPNetwork`, a `torch.nn.Flatten()` layer is inserted before the first `Linear` layer. What does this layer do?

a) Normalizes pixel values to the range $[0, 1]$
*b) Reshapes the input from `[B, 1, 28, 28]` to `[B, 784]` so it can be fed to a fully connected layer
c) Reduces spatial dimensions by taking the maximum in each $2\times2$ window
d) Adds a bias term to every feature dimension

Title: ModuleList vs Sequential
Points: 5
3. The `MLPNetwork` stores its layers in `torch.nn.ModuleList`. What is the main advantage of `ModuleList` over a plain Python list?

*a) PyTorch can track the parameters of all modules inside `ModuleList` for optimization
b) `ModuleList` automatically calls each layer in sequence without a `forward` method
c) `ModuleList` only allows layers of the same type to be combined
d) `ModuleList` prevents duplicate layer definitions

Title: Loss Function for Multi-class Classification
Points: 5
4. The guided project uses `torch.nn.CrossEntropyLoss()`. For an input of raw logits with shape `[B, 10]` and integer labels `y` of shape `[B]`, what does this loss internally compute?

a) Mean squared error between predicted and true class indices
b) Binary cross-entropy applied independently to each of the 10 output logits
*c) Log-softmax of the logits followed by negative log-likelihood with respect to the true class
d) Hinge loss between the predicted scores and $\pm 1$ labels

Title: SGD Momentum
Points: 5
5. The optimizer is created with `torch.optim.SGD(model.parameters(), lr=1e-3, momentum=0.9)`. What does the `momentum=0.9` argument do?

a) It scales the learning rate up by a factor of 0.9 after each epoch
b) It randomly drops 10% of gradient updates to prevent overfitting
*c) It accumulates a moving average of past gradients and adds it to the current update, helping to accelerate training and dampen oscillations
d) It clips gradients whose norm exceeds 0.9

Title: Training Split
Points: 5
6. The code splits `all_training_data` using `torch.utils.data.random_split(all_training_data, [0.9, 0.1])`. After the split, if `all_training_data` has 60,000 samples, how many samples are in `training_data`?

a) 6,000
b) 10,000
*c) 54,000
d) 50,000

Title: model.eval() During Validation
Points: 5
7. In the `loss_and_accuracy` function, `model.eval()` is called before the validation loop. What is the primary effect of this call?

a) It freezes all model parameters so no gradient is computed
b) It changes the optimizer step size to zero
*c) It switches layers like Dropout and BatchNorm to inference mode, disabling training-specific behavior
d) It moves the model to CPU for faster evaluation

Title: Prediction from Logits
Points: 5
8. After a forward pass producing logits `pred` of shape `[B, 10]`, the training code counts correct predictions with `pred.argmax(dim=-1) == y`. What does `argmax(dim=-1)` return?

a) The maximum logit value for each sample
*b) The index of the highest logit for each sample, which is the predicted class label
c) A probability distribution over the 10 classes
d) A boolean tensor indicating which logits exceed zero

