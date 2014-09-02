function [ cnn ] = AgeGenderTraining( train_face, train_age, train_gender, alpha, batchsize, numepochs, layout )

    datax = train_face;
    datay = [train_age/100; train_gender];

    rand('state',0)

    cnn.layers = layout;
    cnn = cnnsetup(cnn, datax, datay);
    opts.alpha = alpha;
    opts.batchsize = batchsize;
    opts.numepochs = numepochs;

    cnn = cnntrain(cnn, datax, datay, opts);
    
end

