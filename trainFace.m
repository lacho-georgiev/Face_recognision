% function f = trainFace(name)
    name = 'LACHO';
    load ExAnfile ex an
    
    if strcmp(name, 'NINA')
        num = 1;
    elseif strcmp(name, 'VASKO')
        num = 2;
    elseif strcmp(name, 'MIRI')
        num = 3;
    elseif strcmp(name, 'LACHO')
        num = 4;
    else
        return;
    end 
        
    cam = webcam;
    box = [512 100 200 200];

    wavelength = 4;
    orientation = 7;

    for i = 1 : 50
            img = snapshot(cam);
            videoFrame = img;
            videoOut = insertObjectAnnotation(videoFrame,'rectangle',box,'NAMESTI SE');
            imshow(videoOut), title('Train face');    

    end

    for i = 1 : 500

        img = snapshot(cam);
        videoFrame = img;

        newImg = imcrop(img, box);
        ImgRes = imresize(newImg,[150 150]);
        grayImg = rgb2gray(ImgRes);
        ImgDouble = double(grayImg);
        [mag,phase] = imgaborfilt(ImgDouble,wavelength,orientation);
        vecImg  = mag(:);
        ImgVector = double(vecImg);

        indx = i + 500 * (i - 1);
        ex{indx} = ImgVector;
        an{num}{i} = indx;

        videoOut = insertObjectAnnotation(videoFrame,'rectangle',box,'HOLD YOUR FACE HERE');
        imshow(videoOut), title('Train face');
    end
    save ExAnfile ex an
% end