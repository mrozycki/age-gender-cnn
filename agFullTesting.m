input_face_norm = test_face_norm;
input_face = test_face;
input_age = test_age;
input_gender = test_gender;

disp('Gender on AGN...');
[~, gacc, ~, gcorr, ~, grms, ~] = AgeGenderTesting(agn_cnn, input_face_norm, input_age, input_gender);
disp(['Accuracy: ' num2str(gacc) '; Correlation: ' num2str(gcorr) '; RMS: ' num2str(grms)]);
disp(' ');

disp('Gender on AG...');
[~, gacc, ~, gcorr, ~, grms, ~] = AgeGenderTesting(ag_cnn, input_face, input_age, input_gender);
disp(['Accuracy: ' num2str(gacc) '; Correlation: ' num2str(gcorr) '; RMS: ' num2str(grms)]);
disp(' ');

disp('Gender on GN...');
[~, gacc, gcorr, grms] = genderTesting(gn_cnn, input_face_norm, input_gender);
disp(['Accuracy: ' num2str(gacc) '; Correlation: ' num2str(gcorr) '; RMS: ' num2str(grms)]);
disp(' ');

disp('Gender on G...');
[~, gacc, gcorr, grms] = genderTesting(g_cnn, input_face, input_gender);
disp(['Accuracy: ' num2str(gacc) '; Correlation: ' num2str(gcorr) '; RMS: ' num2str(grms)]);
disp(' ');

disp('Age on AGN...');
[~, ~, aacc, ~, acorr, ~, amae] = AgeGenderTesting(agn_cnn, input_face_norm, input_age, input_gender);
disp(['Accuracy: ' num2str(aacc) '; Correlation: ' num2str(acorr) '; MAE: ' num2str(amae)]);
disp(' ');

disp('Age on AG...');
[~, ~, aacc, ~, acorr, ~, amae] = AgeGenderTesting(ag_cnn, input_face, input_age, input_gender);
disp(['Accuracy: ' num2str(aacc) '; Correlation: ' num2str(acorr) '; MAE: ' num2str(amae)]);
disp(' ');

disp('Age on AN...');
[~, aacc, acorr, amae] = ageTesting(an_cnn, input_face_norm, input_age);
disp(['Accuracy: ' num2str(aacc) '; Correlation: ' num2str(acorr) '; MAE: ' num2str(amae)]);
disp(' ');

disp('Age on A...');
[~, aacc, acorr, amae] = ageTesting(a_cnn, input_face, input_age);
disp(['Accuracy: ' num2str(aacc) '; Correlation: ' num2str(acorr) '; MAE: ' num2str(amae)]);
disp(' ');