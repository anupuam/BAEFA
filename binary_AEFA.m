
%Chauhan, D., Yadav, A. Binary Artificial Electric Field Algorithm. Evol. Intel. (2022). 
%https://% doi.org/10.1007/s12065-022-00726-x
function [binary_Fbest,Lbest,BestValues,MeanValues]=binary_AEFA(func_num,N,max_it,FCheck,tag,Rpower)
%V:   Velocity.
%a:   Acceleration.
%Q:   Charge  
%D:   Dimension of the test function.
%N:   Number of charged particles.
%X:   Position of particles.
%R:   Distance between charged particle in search space.
%lb:  lower bound of the variables
%ub:  upper bound of the variables
%Rnorm: Euclidean Norm 
Rnorm=2; 
tic;
BAEFA_T2=[];
run=0;
% Dimension and lower and upper bounds of the variables
[lb,ub,D]=MyTestFunction_range(func_num);  

%------------------------------------------------------------------------------------
%random initialization of charge population.
X=rand(N,D).*(ub-lb)+lb;
%create the best so far chart and average fitnesses chart.
BestValues=[];MeanValues=[];
% for i=1:size(X,1) % For each particle
%     for j=1:size(X,2) % For each variable
%         if rand<=0.5
%             X(i,j)=0;
%         else
%             X(i,j)=1;
%         end
%     end
% end
V=rand(N,D);

%-------------------------------------------------------------------------------------
for iteration=1:max_it
%Evaluation of fitness values of charged particles. 
 for i=1:N 
    %calculation of objective function for charged particle 'i'
    fitness(i)=MyTestFunction(X(i,:),func_num,D);
 end
  %fitness =benchmark(X,func_num,D);
    if tag==1
    [best, best_X]=min(fitness); %minimization.
    else
    [best, best_X]=max(fitness); %maximization.
    end        
    if iteration==1
       binary_Fbest=best;Lbest=X(best_X,:);
    end
    if tag==1
      if best<binary_Fbest  %minimization.
       binary_Fbest=best;
       Lbest=X(best_X,:);
      end
    else 
      if best>binary_Fbest  %maximization
       binary_Fbest=best;Lbest=X(best_X,:);
      end
    end
BestValues=[BestValues binary_Fbest];
MeanValues=[MeanValues mean(fitness)];
%-----------------------------------------------------------------------------------
% Charge 
Fmax=max(fitness); Fmin=min(fitness); Fmean=mean(fitness); 
if Fmax==Fmin
   Q=ones(N,1);
else
   if tag==1 %for minimization
      best=Fmin; worst=Fmax; 
      else %for maximization
       best=Fmax; worst=Fmin; 
   end
  Q=exp((fitness-worst)./(best-worst)); 
end
Q=Q./sum(Q);
%----------------------------------------------------------------------------------
fper=3; %In the last iteration, only 2-6 percent of charges apply force to the others.
%----------------------------------------------------------------------------------
%%%%total electric force calculation
 if FCheck==1
     cbest=fper+(1-iteration/max_it)*(100-fper); 
     cbest=round(N*cbest/100);
 else
     cbest=N; 
 end
    [Qs s]=sort(Q,'descend');
 for i=1:N
     E(i,:)=zeros(1,D);
     for ii=1:cbest
         j=s(ii);
         if j~=i
            R=norm(X(i,:)-X(j,:),Rnorm); %Euclidian distance.
         for k=1:D 
             E(i,k)=E(i,k)+ rand()*(Q(j))*((X(j,k)-X(i,k))/(R^Rpower+eps));
          end
         end
     end
 end
 
%---------------------------------------------------------------------------------- 
%Calculation of Coulomb constant
%----------------------------------------------------------------------------------
K0=500; alfa=10;
 K=K0*exp(-alfa*iteration/max_it);
%--------------------------------------------------------------------------------- 
%%%Calculation of accelaration.
  a=E*K;
%----------------------------------------------------------------------------------
% Velocity Update
Vmax=4;
[N,d]=size(X);
V=rand(N,d).*V+a;
 Vmax=4;
if V>Vmax
    V=Vmax;
 end
if V<-Vmax
   V=-Vmax;
end 
% Position update
 
%% predefine S-shape transfer function
%    S=1./(1+exp(-V));               
% for i=1:N
%     for j=1:D
%   if rand(i,j)<S(i,j) 
%     X(i,j)=1;
%   else
%      X(i,j)=0;
%   end
%     end
% end
%% V1 predefine V-shape transfer function
S=abs(tanh(V));                 
 temp1=rand(N,D);
  for i=1:N
            for j=1:D
                if temp1(i,j)<S(i,j)
                    X(i,j)=not(X(i,j));
                else
                    X(i,j)=(X(i,j));
                end
            end
  end
%% Conversion binary to real number
% X;
% for j=1:N
%     X(j)=sum(X(j,:).*2^j);
% end
% for j=1:N
% X(j,:)=ub-X(j,:).*(ub-lb)./2^j
% end
%%---------------------------------------------------------------------------------
%----------------------------------------------------------------------------------
%plot charged particles 
%mask it if you do not need to plot them
%----------------------------------------------------------------------------------
% swarm(1:N,1,1)=X(:,1);
% swarm(1:N,1,2)=X(:,2);
% clf    
%     plot(swarm(:, 1, 1), swarm(:, 1, 2), 'X')  % drawing swarm movements
%     hold on;
%     plot(swarm(best_X,1,1),swarm(best_X,1,2),'*r') % drawning of best charged particle
%     axis([lb ub lb ub]);
%      title(['\fontsize{12}\bf Iteration:',num2str(iteration)]);
% pause(.2)
%---------------------------------------------------------------------------------
end 
end
%end



