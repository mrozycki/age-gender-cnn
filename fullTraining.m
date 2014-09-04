%disp('AGN');
%agn_cnn = AgeGenderTraining(train_face_norm, train_age, train_gender, 0.5, 5, 50, layout);
%agn_cnn = cnnff(agn_cnn, train_face_norm(:,:,1:2));
%save('agn_cnn.mat', 'agn_cnn');
%disp('');

%disp('AG');
%ag_cnn = AgeGenderTraining(train_face, train_age, train_gender, 0.5, 5, 50, layout);
%ag_cnn = cnnff(ag_cnn, train_face_norm(:,:,1:2));
%save('ag_cnn.mat', 'ag_cnn');
%disp('');

%disp('AN');
%an_cnn = ageTraining(train_face_norm, train_age, 0.5, 5, 50, layout);
%an_cnn = cnnff(an_cnn, train_face_norm(:,:,1:2));
%save('an_cnn.mat', 'an_cnn');
%disp('');

disp('A');
a_cnn = ageTraining(train_face, train_age, 0.5, 5, 50, layout);
a_cnn = cnnff(a_cnn, train_face_norm(:,:,1:2));
save('a_cnn.mat', 'a_cnn');
disp('');

%disp('GN');
%gn_cnn = genderTraining(train_face_norm, train_gender, 0.5, 5, 50, layout);
%gn_cnn = cnnff(gn_cnn, train_face_norm(:,:,1:2));
%save('gn_cnn.mat', 'gn_cnn');
%disp('');

disp('G');
g_cnn = genderTraining(train_face, train_gender, 0.5, 5, 50, layout);
g_cnn = cnnff(g_cnn, train_face_norm(:,:,1:2));
save('g_cnn.mat', 'g_cnn');
disp('');