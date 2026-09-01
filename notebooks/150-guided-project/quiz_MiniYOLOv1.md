Quiz title: MiniYOLOv1 Quiz
Quiz description: A quiz covering YOLO-style object detection, grid-based prediction, objectness scores, YOLO composite loss functions, IoU computation, Non-Maximum Suppression, and the COCO dataset format.

Title: YOLO Grid Assignment
Points: 5
1. In the YOLO format used by `YOLODataset`, an object's annotation is assigned to a specific grid cell. Which grid cell is responsible for predicting an object?

a) The grid cell with the largest overlap with the bounding box
b) The grid cell at the top-left corner of the bounding box
*c) The grid cell that contains the center of the bounding box
d) The grid cell with the highest objectness score after the forward pass

Title: YOLO Target Tensor Layout
Points: 5
2. The target tensor for each grid cell has layout `[obj, x_rel, y_rel, w_norm, h_norm, c0, c1, ..., cN]`. What does `obj` (the first element) represent?

*a) A binary flag equal to 1 if an object's center falls in that grid cell, and 0 otherwise
b) The predicted confidence score output by the network for that cell
c) The normalized area of the bounding box relative to the full image
d) The class index encoded as a floating-point integer

Title: YOLO Composite Loss — Box Weighting
Points: 5
3. In `YOLOLoss`, the box regression term is multiplied by `lambda_coord=5.0`. What is the purpose of this weighting?

a) To reduce the influence of box predictions on the total loss so the classifier trains faster
b) To normalize the box coordinates to the range $[0, 1]$
*c) To upweight the localization loss relative to the objectness loss, because box regression errors in cells with objects are more important to correct
d) To apply a penalty only when the predicted box is larger than the ground-truth box

Title: YOLO Composite Loss — No-Object Weighting
Points: 5
4. In `YOLOLoss`, the no-object confidence loss is multiplied by `lambda_noobj=0.5`. Why is this weight less than 1?

*a) Most grid cells contain no object, so without down-weighting their loss the model would be dominated by learning to suppress background cells rather than detecting objects
b) The no-object cells have larger gradients, so they need a smaller weight to prevent exploding gradients
c) Cells without objects do not contribute any class predictions, so their loss should be ignored entirely
d) The objectness loss is already computed with BCEWithLogitsLoss which automatically balances positive and negative samples

Title: SmoothL1 Loss for Box Regression
Points: 5
5. The box regression in `YOLOLoss` uses `nn.SmoothL1Loss` instead of mean squared error. What is the advantage of SmoothL1 for bounding box coordinates?

a) SmoothL1 is differentiable everywhere unlike MSE, so it enables gradient computation
b) SmoothL1 produces integer outputs, making it compatible with discrete box coordinates
*c) SmoothL1 is less sensitive to large outlier errors than MSE (it behaves like L1 for large errors), making training more stable when some box predictions are far off
d) SmoothL1 automatically normalizes coordinates to the range $[0, 1]$

Title: Intersection over Union
Points: 5
6. The `compute_iou` function computes Intersection over Union (IoU) for two bounding boxes. Which formula correctly defines IoU?

a) $\text{IoU} = \frac{\text{intersection area}}{\text{area of box 1}}$
b) $\text{IoU} = \frac{\text{union area}}{\text{intersection area}}$
*c) $\text{IoU} = \frac{\text{intersection area}}{\text{union area}}$
d) $\text{IoU} = \frac{\text{intersection area}}{\text{area of box 1} + \text{area of box 2}}$

Title: Non-Maximum Suppression
Points: 5
7. The `nms` function removes redundant bounding box predictions. After sorting boxes by confidence descending, what does NMS do in each iteration?

a) It keeps only the box with the lowest confidence score to avoid duplicates
*b) It selects the highest-confidence box, adds it to the kept list, and removes all remaining boxes whose IoU with the selected box exceeds the threshold
c) It averages overlapping boxes together to produce a single consensus box
d) It discards all boxes whose confidence is below the average confidence of the batch

Title: TinyYOLO Architecture Stride
Points: 5
8. `TinyYOLO` uses five `ConvBlock` layers each with `stride=2`, reducing spatial dimensions from the input size to the grid. If the input image is $256 \times 256$, what is the grid size (height and width) of the output feature map?

a) $32 \times 32$
b) $16 \times 16$
*c) $8 \times 8$
d) $4 \times 4$

