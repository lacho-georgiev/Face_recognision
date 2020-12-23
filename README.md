# Face_recognision
Recognise faces from given training images.
Using KLT feature tracker and gabor filter.

== How to run ==

To train from existing images.
- Put the training data in folder `data/` and rename them to `IMG_indx` (indx = 1 : n)
- Run images.m to detect faces from the images and put them in `/deep_learning/cropped`
- Rename all the photos that are faces into `FACE_indx` (indx = 1 : n)
- Make vector for each person in `read_labels.m`
example: `layers{i} = [1 8 11 13 15 ....]`
- Change `n_ex` in training_data.m for the number of photos avaible

OR

To train by creating new training data from camera.
- Call trainFace('Name')
- Uncomment "load `ExAnfile.mat` ex an" in deep_learning.m and run the program

Then:
- Configure epochs, m, eta, layers[] in deep_learning.m and run the program
- After the training is done if you want to save 'w, b, L' manually into a file use: "save bwLfile.mat b w L"

Run `face.m`
