Quiz title: MiniYOLOv2 Quiz
Quiz description: A quiz covering the MiniYOLOv2 architecture, CSP blocks, residual connections, SiLU activation, Feature Pyramid Network neck, Distribution Focal Loss, DFL decoding, AdamW optimizer, cosine annealing, and gradient clipping.

Title: CSPBlock Purpose
Points: 5
1. The `CSPBlock` in MiniYOLOv2 splits the input into two branches: one goes through residual blocks and the other is a bypass, then both are concatenated and fused. What is the main benefit of this Cross Stage Partial design?

a) It doubles the number of parameters by processing the input twice in parallel
b) It eliminates the need for batch normalization inside the block
*c) It improves gradient flow by providing a shorter path through the bypass branch while keeping residual learning, reducing redundant gradient information
d) It replaces the need for a detection head by directly predicting bounding boxes in each branch

Title: ResBlock Identity Skip Connection
Points: 5
2. The `ResBlock` in MiniYOLOv2 computes `x + self.cv2(self.cv1(x))`. What problem does the identity skip connection (`+ x`) primarily help solve?

a) It prevents the model from overfitting by randomly zeroing out activations
*b) It mitigates the vanishing gradient problem in deep networks by allowing gradients to flow directly through the skip path without passing through non-linear activations
c) It reduces the number of parameters by sharing weights across layers
d) It enforces that the output has the same magnitude as the input at every layer

Title: SiLU Activation
Points: 5
3. `ConvBNAct` in MiniYOLOv2 uses `nn.SiLU(inplace=True)` instead of `nn.ReLU`. The SiLU (Sigmoid Linear Unit) function is defined as $\text{SiLU}(x) = x \cdot \sigma(x)$. What distinguishes SiLU from ReLU?

a) SiLU maps all negative inputs to exactly zero, same as ReLU
b) SiLU is not differentiable at $x = 0$, unlike ReLU
*c) SiLU is smooth and non-monotonic, producing small non-zero outputs for negative inputs, which can improve gradient flow compared to the hard zero of ReLU
d) SiLU divides the input by its absolute value, making all outputs $\pm 1$

Title: FPN Neck Architecture
Points: 5
4. The `MiniYOLOv2` neck first upsamples `p5` and concatenates it with `p4`, then downsamples and concatenates with `p5` again. This feature pyramid network (FPN) pattern serves what purpose?

a) It reduces memory usage by discarding the shallow feature maps from earlier layers
b) It converts multi-channel feature maps into a single-channel output for the detection head
*c) It fuses high-resolution spatial detail from shallower layers with high-level semantic features from deeper layers, improving detection of objects at different scales
d) It applies data augmentation to the intermediate feature maps during training

Title: Distribution Focal Loss Output Dimensions
Points: 5
5. MiniYOLOv2 uses `REG_MAX = 8` bins for Distribution Focal Loss (DFL). For a model with `NUM_CLASSES = 80`, what is the total number of values predicted per grid cell?

a) $1 + 4 + 80 = 85$
b) $1 + 8 + 80 = 89$
*c) $1 + 4 \times 8 + 80 = 113$
d) $4 \times 8 + 80 = 112$

Title: DFL Decoding
Points: 5
6. In `decode_boxes_v2`, the DFL distribution for one box coordinate is decoded as `(torch.softmax(dist_logits, dim=-1) * bins).sum(-1)`. What does this operation compute?

a) The maximum bin index, representing the most likely discrete box coordinate
b) The variance of the predicted distribution over box coordinates
*c) The expected value (weighted sum) of the bin indices under the predicted distribution, giving a continuous coordinate estimate
d) The cross-entropy loss between the predicted distribution and the target bin

Title: AdamW vs Adam
Points: 5
7. The MiniYOLOv2 training uses `torch.optim.AdamW(model.parameters(), lr=1e-3, weight_decay=1e-4)`. How does AdamW differ from standard Adam?

a) AdamW uses a fixed learning rate and does not adapt per-parameter step sizes
b) AdamW replaces the momentum term with a cosine annealing schedule
*c) AdamW applies weight decay directly to the parameters rather than folding it into the gradient, which correctly decouples regularization from the adaptive learning rate scaling
d) AdamW uses second-order curvature information to compute parameter updates

Title: Gradient Clipping
Points: 5
8. The training loop calls `nn.utils.clip_grad_norm_(model.parameters(), max_norm=10.0)` before `optimizer.step()`. What does gradient clipping prevent?

a) It prevents the learning rate from increasing beyond `max_norm` during training
b) It removes gradients from layers that have not been updated in the current batch
*c) It prevents exploding gradients by scaling down the gradient vector when its norm exceeds `max_norm`, keeping parameter updates bounded and training stable
d) It prevents gradient values from becoming negative, ensuring monotone loss decrease

