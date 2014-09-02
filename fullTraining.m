layout_ext = {
    struct('type', 'i') %input layer
    struct('type', 'c', 'outputmaps', 3, 'kernelsize', 11) %convolution layer
    struct('type', 's', 'scale', 2) %sub sampling layer
    struct('type', 'c', 'outputmaps', 6, 'kernelsize', 8) %convolution layer
    struct('type', 's', 'scale', 2) %subsampling layer
    struct('type', 'c', 'outputmaps', 9, 'kernelsize', 5) %convolution layer
    struct('type', 's', 'scale', 2) %subsampling layer
};

layout_small = {
    struct('type', 'i') %input layer
    struct('type', 'c', 'outputmaps', 3, 'kernelsize', 11) %convolution layer
    struct('type', 's', 'scale', 2) %sub sampling layer
    struct('type', 'c', 'outputmaps', 6, 'kernelsize', 6) %convolution layer
    struct('type', 's', 'scale', 2) %subsampling layer
};

agn_cnn = AgeGenderTraining(train_face_norm, train_age, train_gender, 0.5, 5, 50, layout_ext);
agn_cnn = cnnff(agn_cnn, train_face_norm(:,:,1:2));
save('agn_cnn.mat', 'agn_cnn');

ag_cnn = AgeGenderTraining(train_face, train_age, train_gender, 0.5, 5, 50, layout_ext);
ag_cnn = cnnff(ag_cnn, train_face_norm(:,:,1:2));
save('ag_cnn.mat', 'ag_cnn');

an_cnn = ageTraining(train_face_norm, train_age, 0.5, 5, 50, layout_ext);
an_cnn = cnnff(an_cnn, train_face_norm(:,:,1:2));
save('an_cnn.mat', 'an_cnn');

a_cnn = ageTraining(train_face, train_age, 0.5, 5, 50, layout_ext);
a_cnn = cnnff(a_cnn, train_face_norm(:,:,1:2));
save('a_cnn.mat', 'a_cnn');

gn_cnn = genderTraining(train_face_norm, train_gender, 0.5, 5, 50, layout_ext);
gn_cnn = cnnff(gn_cnn, train_face_norm(:,:,1:2));
save('gn_cnn.mat', 'gn_cnn');

g_cnn = genderTraining(train_face, train_gender, 0.5, 5, 50, layout_ext);
g_cnn = cnnff(g_cnn, train_face_norm(:,:,1:2));
save('g_cnn.mat', 'g_cnn');