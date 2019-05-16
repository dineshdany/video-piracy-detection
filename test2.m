close all;
clc;


myFile=dir('E:\IIIT WORKS\Matlb\BTP2\videos\Test\High\*.MP4'); 
mNIQE=[];
mBRISQUE=[];
mPIQE=[];
Predict_value=[];
n4=1;
s=[];
Audio_Quality=[];

for m = 1 : 6
     thisfilename = fullfile(myFile(m).folder, myFile(m).name);
      [input_file, Fs] = audioread(thisfilename);
    audiowrite('E:\IIIT WORKS\Matlb\BTP2\Audio\testaudio1.WAV', input_file, Fs);
    [y,fs]=audioread('E:\IIIT WORKS\Matlb\BTP2\Audio\testaudio1.WAV');
    loudness = integratedLoudness(y,fs);
    s=loudness;
    thisVideo = VideoReader(thisfilename);
    a=thisVideo;
i=33;
while hasFrame(a)
    if( i==80)
      break;
    end
    b=readFrame(a);    
    imwrite(b,['E:\IIIT WORKS\Matlb\BTP2\images\Image' ,int2str(i), '.jpg']);
    i=i+1;
end
myfile=dir('E:\IIIT WORKS\Matlb\BTP2\images\*.jpg'); 
n=[];
y=[];
z=[];
x=1;
for k = 20 : 60
       
try
    thisFileName = fullfile(myfile(k).folder, myfile(k).name);
    thisImage = imread(thisFileName);   
    score_niqe=niqe(thisImage);
    score_brisque=brisque(thisImage);
    score_piqe=piqe(thisImage);
    n(x)= score_niqe;
    y(x)= score_brisque;
    z(x)=score_piqe;
    n3=mean(n);
    y3=mean(y);
    z3=mean(z);
    x=x+1;
catch
    display("Null Image");
end

fprintf('High Quality NIQE score mean : %f\n\n',n3);
fprintf('High Quality BRISQUE score mean : %f\n\n',y3);
fprintf('High Quality PIQE score mean : %f\n\n',z3);
 
end

mNIQE(n4)=n3;
mBRISQUE(n4)=y3;
mPIQE(n4)=z3;
Audio_Quality(n4)=s;
Predict_value(n4)=1;
n4=n4+1;

end


myFile1=dir('E:\IIIT WORKS\Matlb\BTP2\videos\Test\Low\*.MP4');
s1=[];

for m1 = 1 : 6
     thisfilename = fullfile(myFile1(m1).folder, myFile1(m1).name);
    [Input_File, FS] = audioread(thisfilename);
     audiowrite('E:\IIIT WORKS\Matlb\BTP2\testaudiofile.WAV', Input_File, FS);
     [Y,FS]=audioread('E:\IIIT WORKS\Matlb\BTP2\testaudiofile.WAV');
     loudness1 = integratedLoudness(Y,FS);
     s1=loudness1;
    thisVideo1 = VideoReader(thisfilename1);
    a1=thisVideo1;
i1=33;
while hasFrame(a1)
    if( i1==80)
      break;
    end
    b1=readFrame(a1);    
    imwrite(b1,['E:\IIIT WORKS\Matlb\BTP2\images\images1\Image' ,int2str(i1), '.jpg']);
    i1=i1+1;
end
myfile1=dir('E:\IIIT WORKS\Matlb\BTP2\images\images1\*.jpg'); 
x1=1;
n1=[];
y1=[];
z1=[];


for k1 = 16 : 56
       
try
    thisFileName1 = fullfile(myfile1(k1).folder, myfile1(k1).name);
    thisImage1 = imread(thisFileName1);   
    score_niqe1=niqe(thisImage1);
    score_brisque1=brisque(thisImage1);
    score_piqe1=piqe(thisImage1);
    n1(x1)= score_niqe1;
    y1(x1)= score_brisque1;
    z1(x1)=score_piqe1;
    
    x1=x1+1;
catch
    display("Null Image");
end

fprintf('Low Quality NIQE score mean : %f\n\n',score_niqe1);
fprintf('Low Quality BRISQUE score mean : %f\n\n',score_brisque1);
fprintf('Low Quality PIQE score mean : %f\n\n',score_piqe1);


end
mNIQE(n4)=mean(n1);
mBRISQUE(n4)=mean(y1);
mPIQE(n4)=mean(z1);
Audio_Quality(n4)=s1;
Predict_value(n4)=0;
n4=n4+1;

end

mNIQE=transpose(mNIQE);
mBRISQUE=transpose(mBRISQUE);
mPIQE=transpose(mPIQE);
Audio_Quality=transpose(Audio_Quality);
Predict_value=transpose(Predict_value);



T=table(mNIQE,mBRISQUE,mPIQE,Audio_Quality,Predict_value);
writetable(T,'E:\IIIT WORKS\Matlb\BTP2\test2.csv');
type('E:\IIIT WORKS\Matlb\BTP2\test2.csv');


