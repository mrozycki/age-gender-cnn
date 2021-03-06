function cnn = genderTraining(datax, datay, alpha, batchsize, numepochs, layout)
rand('state',0)

cnn.layers = layout;
cnn = cnnsetup(cnn, datax, datay);

opts.alpha = alpha;
opts.batchsize = batchsize;
opts.numepochs = numepochs;

cnn = cnntrain(cnn, datax, datay, opts);
cnn = cnnff(cnn, datax);
disp(['Accuracy on training data: ' 100.0*sum(datay == round(cnn.o))/(floor(size(datax,3)/batchsize) * batchsize)]);