function [net, gacc, aacc, gcorr, acorr, grms, amae] = AgeGenderTesting(net, test_face, test_age, test_gender)

    net = cnnff(net, test_face);
    out_age = net.o(1,:);
    out_gender = net.o(2,:);
    
    gacc = 100.0*sum(test_gender(1,:) == round(out_gender))/length(test_face);
    gcorr = corr(out_gender', test_gender');
    grms = norm(net.e(2,:));
    
    [x,y] = meshgrid(out_age*100, [0 3 8 13 20 37 66]);
    age_labels = [1 5 10 16 28 51 75];
    class_predictions = age_labels(sum(x > y));
    aacc = sum(class_predictions == test_age)/length(test_face)*100;
    acorr = corr(out_age', test_age');
    amae = mean(abs(100*out_age - test_age));

end