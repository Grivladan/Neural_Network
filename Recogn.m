names = fileread('Neuro_Recogn/File_Name_tx1.txt');
str_names = strsplit(names);
a = cell(20);
for i=1:16
    s = strcat('Neuro_Recogn/',str_names{i},'.bmp');
    a{i} = imread(s);
    a{i} = reshape(a{i}(:,:,1),256,1);
end;
input = im2double(horzcat(a{1},a{2},a{3},a{4},a{5},a{6},a{7},a{8},a{9},a{10},a{11},a{12},a{13},a{14},a{15},a{16}));


load net2;
load net3;
load net4;

net2(input)
net3(input)
net4(input)