clear
faceDetector = vision.CascadeObjectDetector();
cam = webcam(2); % webcamlist to show all cams that are avaible
wavelength = 2;
orientation = 0;
while true
    img = snapshot(cam);
    videoFrame = img;
    bbox = step(faceDetector, videoFrame);
    sizeb = size(bbox);
    if sizeb(1) == 0
       continue; 
    end
    out = cell(sizeb(1), 2);
    d = 1;
    for j = 1 : sizeb(1)
        newImg = imcrop(img, bbox(j, :));
        ImgRes = imresize(newImg,[150 150]);
        grayImg = rgb2gray(ImgRes);
        ImgDouble = double(grayImg);
        [mag,phase] = imgaborfilt(ImgDouble,wavelength,orientation);
        vecImg  = mag(:);
%         vecImg  = ImgDouble(:);
        ImgVector = double(vecImg);
        cd './deep_learning/'
        result = whichFace(ImgVector);
        cd ..
        if result(1) > 0.7
            out{d, 2} = ['NINA'];
        elseif result(2) > 0.7
            out{d, 2} = ['VASKO'];
        elseif result(3) > 0.7
            out{d, 2} = ['MIRI'];
        elseif result(4) > 0.7
            out{d, 2} = ['LACHO'];
        else
            continue;
        end
        out{d, 1} = bbox(j, :);
        d = d + 1;
    end
    d = d - 1;
    if d == 0
        continue;
    end
    for i = 1 : d
        box(i, :) = out{i, 1};
        name{i} = out{i, 2};
    end
    videoOut = insertObjectAnnotation(videoFrame,'rectangle',box,name);
    imshow(videoOut), title('Detected faces');
    clear box name
end