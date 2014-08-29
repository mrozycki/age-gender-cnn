function [ out ] = convertAges( in )

    out(in == 1) = 0;
    out(in == 5) = 3;
    out(in == 10) = 8;
    out(in == 16) = 13;
    out(in == 28) = 20;
    out(in == 51) = 37;
    out(in == 75) = 67;
    
end