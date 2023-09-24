%Usage: z=Goldindec(A,p,peak_ratio,eps,b_path); 
%A is a vector with two columns, in which the first column is Raman wave number, while the second column is Raman intensity. 
%p is the polynomial prder. 
%peak_ratio is the ratio of peaks. 
%eps is the parameter ¦Å to terminate the iteration and users can specify this value.
%b_path is the output path of the final fitted baseline.
%z is the fitted baseline.
addpath D:\Goldindec\ %change to the path of Goldindec
for i=1:2

% load D:\Goldindec\r6g-2.csv %add the mineral Albite from its path
Albite=csvread(['D:\Goldindec\r6g-',num2str(i),'.csv'],2,0);
Goldindec(Albite,20,0.5,0.0001,['D:\Goldindec\sample_test\Baseline',num2str(i),'.xls']); %z is the baseline of Raw Raman data of Albite

end


