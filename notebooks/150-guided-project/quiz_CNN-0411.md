Quiz title: CNN Guided Project Quiz
Quiz description: A quiz covering CIFAR-10 dataset normalization, convolutional layer parameters, MaxPooling, translation invariance, Sobel edge detection, Conv2d weight counts, and model checkpointing.

Title: CIFAR-10 Image Shape
Points: 5
1. After loading a CIFAR-10 image with `ToTensor()`, what is the shape of a single image tensor?

a) `torch.Size([1, 32, 32])`
b) `torch.Size([32, 32, 3])`
*c) `torch.Size([3, 32, 32])`
d) `torch.Size([3, 1024])`

Title: Dataset Normalization
Points: 5
2. The CIFAR-10 dataset is loaded with `Normalize(DATASET_MEAN, DATASET_STD)` where `DATASET_MEAN = [0.4914, 0.4822, 0.4465]`. What is the purpose of this normalization?

a) To compress the images to smaller file sizes
b) To convert RGB images to grayscale
*c) To shift and scale each channel so its mean is approximately 0 and standard deviation is approximately 1, which stabilizes training
d) To randomly augment the images so the model sees different versions each epoch

Title: Conv2d Parameter Count
Points: 5
3. The layer `tnn.Conv2d(3, 16, 3, stride=2, padding=1)` is applied to a 3-channel input. How many trainable weight parameters (excluding bias) does this layer have?

a) 48
b) 144
*c) 432
d) 4608

Title: Output Spatial Size After Conv2d
Points: 5
4. A `Conv2d(3, 16, 3, padding=1)` layer (no stride) is applied to a `[3, 32, 32]` image. What is the spatial size of the output feature map?

a) `[16, 30, 30]`
*b) `[16, 32, 32]`
c) `[16, 34, 34]`
d) `[16, 16, 16]`

Title: MaxPool2d Behavior
Points: 5
5. After `tnn.MaxPool2d(2)` is applied to a `[16, 32, 32]` feature map, what is the resulting shape?

a) `[16, 30, 30]`
b) `[32, 16, 16]`
*c) `[16, 16, 16]`
d) `[16, 64, 64]`

Title: Convolution and Translation Invariance
Points: 5
6. Why do convolutional layers provide translation invariance compared to fully connected layers?

a) They use a larger number of parameters, allowing them to memorize more positions
b) They apply global average pooling to remove spatial information entirely
*c) They share the same learned filter weights across all spatial positions, so the same feature can be detected regardless of where it appears in the image
d) They use max-pooling to select only the strongest activation across the entire image

Title: Sobel Filter Application
Points: 5
7. The notebook manually sets a `Conv2d(1, 1, kernel_size=3)` weight to the matrix $[[-1, 0, 1], [-1, 0, 1], [-1, 0, 1]]$. What does applying this filter to a grayscale image compute?

a) A blurred (smoothed) version of the image
b) The horizontal average intensity in each local region
*c) A horizontal edge detector that highlights vertical boundaries in the image
d) A Gaussian blur that reduces high-frequency noise

Title: Model Checkpointing
Points: 5
8. In the CNN training code, the model is saved using `torch.save({'epoch': t, 'model_state_dict': model.state_dict(), 'optimizer_state_dict': optimizer.state_dict()}, ...)`. Why is the optimizer state saved alongside the model weights?

a) The optimizer state stores the dataset and transforms needed for inference
*b) Saving the optimizer state (e.g., momentum buffers, adaptive learning rates) allows training to resume from the exact same optimization trajectory without restarting from scratch
c) The optimizer state is required to perform a forward pass during inference
d) Without saving the optimizer state, the model weights cannot be reloaded correctly

