% "B-AEFA: Binary Artificial electric field algorithm." Evolutionary Intelligence 48, pp. 1-29 (2022)
% https://doi.org/10.1007/s12065-022-00726-x
% Anupam Yadav, Department of Mathematics, NIT Jalandhar
% anupuam@gmail.com
 clear all;
  clc;
data=[]; data1=[];
for i=1:1

    rng('default')
rng(1);
 N=30; 
 max_it=500; 
%  iter_max=max_it;
 FCheck=1; R=1;
 tag=1; % 1: minimization, 0: maximization
 rand('seed', sum(100*clock));
 func_num=i
 [binary_Fbest,Lbest,BestValues,MeanValues]=binary_AEFA(func_num,N,max_it,FCheck,tag,R);binary_Fbest   
end