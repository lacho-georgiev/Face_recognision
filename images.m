clear
for i = 1 : 350
    i
    if isfile(['./data/IMG_' num2str(i) '.JPG'])
        Img = imread(['./data/IMG_' num2str(i) '.JPG']);

        faceDetector = vision.CascadeObjectDetector();

        videoFrame      = Img;
        bbox            = step(faceDetector, videoFrame);

        sizeb = size(bbox);
        for j = 1 : sizeb(1)
            if bbox(j, 3) > 100 % to ingore the wrong "faces"
                newImg = imcrop(Img, bbox(j, :));
                ImgRes = imresize(newImg,[150 150]);
                ImgGray = rgb2gray(ImgRes);
%                 figure(j)
%                 imshow(ImgGray)
                imwrite(ImgGray,['./deep_learning/cropped/IMG_' num2str(i) '_' num2str(j) '.png'])
            end
        end
    end
end
