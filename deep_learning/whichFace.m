function r = whichFace(a1)
    load 'bwLfile.mat' b w L
    r = feedforward(a1, b, w, L);
end