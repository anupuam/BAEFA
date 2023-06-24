function fit=MyTestFunction(X,func_num,D)
bias=+80;
if func_num==1 %% Sphere function
    fit =sum(X.^2);
end
if func_num==2  %%%De Jong f4
    fit =sum([1:D].*X.^4);
end
if func_num==3 %%%Ackley function
    fit=-20*exp(-.2*sqrt(sum(X.^2)/D))-exp(sum(cos(2*pi.*X))/D)+20+exp(1);
end
if func_num==4   %%% Apline 1 function
     fit =sum(abs(X.*sin(X)+0.1*X));
 end
if func_num==5   %%% exponential function
    fit =-(exp(-0.5*sum(X.^2)))+1;
end
%  if func_num==6   %%% Brown 3
%      for j=1:D-1
%      fit=sum((X(j).^(2*X(j+1).^2)+1)+X(j+1).^(2*X(j).^2)+1);
%      end
%  end
if func_num==6     %%%  Multiplication of squares function
    fit=prod([1:D].*X.^2);
 end
 if func_num==7   %% Schwefel 222 
fit=sum(abs(X))+prod(abs(X));
end
if func_num==8     %%%  Axis parallel hyper elipsoid
    fit=sum([1:D].*X.^2);
end
 if func_num==9     %% Sum of different power
     for j=1:D
     fit = sum(abs(X.^j));
     end
 end
 if func_num==10        %% Step function
     for j=1:D
     fit=(ceil(X(j)+0.5)).^2;
     end
 end
 if func_num==11   %% Rotated hyper ellipsoid
     for j=1:D
         for i=1:j
     fit = sum(X(j).^2);
         end
     end
 end
if func_num==12  %%% Levy montalvo 2          
    fit=.1*((sin(3*pi*X(1)))^2+sum((X(1:D-1)-1).^2.*(1+(sin(3.*pi.*X(2:D))).^2))+...
        ((X(D)-1)^2)*(1+(sin(2*pi*X(D)))^2))+sum(Ufun(X,5,100,4));
end
if func_num==13   %% Beale
    fit=(1.5-X(1)*(1-X(2)))^2+(2.25-X(1)*(1-X(2)^2))^2+(2.625-X(1)*(1-X(2)^3))^2;
end
if func_num==14     %% Colville
    fit = 100*(X(2)-X(1).^2).^2+(1-X(1)).^2+90*(X(4)-X(3).^2).^2+(1-X(3)).^2+10.1*((X(2)-1).^2+(X(4)-1).^2)+19.8*(X(2)-1).*(X(4)-1);
end
if func_num==15  %% Rotated ellipse01
    fit =7*X(1).^2-6*sqrt(3)*X(1).*X(2)+13*X(2).^2;
end
if func_num==16  %% Rotated ellipse02
    fit =X(1).^2-X(1).*X(2)+X(2).^2;
end
if func_num==17     %% Gear train
    fit=((1/6.931)-(X(1).*X(2)./(X(3).*X(4)))).^2;
end
if func_num==18           %% Three hump camel function
fit =2*(X(1).^2)-1.05*X(1).^4+(X(1).^6)./6+X(1).*X(2)+X(2).^2;
 end
 if func_num==19       %% Six hump camel function
     fit=(4-2.1*X(1).^2+(X(1).^4)./3).*X(1).^2+X(1).*X(2)+(-4+4*X(2).^2).*X(2).^2;
 end
  if func_num==20       %% Easom function
     fit=-cos(X(1)).*cos(X(2)).*exp(-(X(1)-pi).^2-(X(2)-pi).^2);
  end
 if func_num==21  %%%%Drop-wave function
    fit=-((1+cos(12*sqrt(X(1).^2+X(2).^2)))./(0.5*(X(1).^2+X(2).^2)+2));
 end
if func_num==22  %%% Rastrigin function
    fit=sum(X.^2-10*cos(2*pi.*X))+10*D;
end
if func_num==23  %%% Rosenbrock' valley function
    fit=sum(100*(X(2:D)-(X(1:D-1).^2)).^2+(X(1:D-1)-1).^2);
end
if func_num==24 %%% Max mod function
    fit=max(abs(X));
end
if func_num==25
    %X=X-40;
fit=sum((X+40).^2)-80;
%fit=fit+bias;
end

if func_num==26 
    X=X-7;
fit=sum(abs(X))+prod(abs(X));
fit=fit+bias;
end

if func_num==27
     X=X-60;
    fit=0;
    for i=1:D
    fit=fit+sum(X(1:i))^2;
    end
    fit=fit+bias;
end

if func_num==28
     X=X-60;
    fit=max(abs(X));
    fit=fit+bias;
end

if func_num==29
    X=X-12;
    fit=sum(100*(X(2:D)-(X(1:D-1).^2)).^2+(X(1:D-1)-1).^2);
    fit=fit+bias;
end

if func_num==30
     X=X-60;
    fit=sum(abs((X+.5)).^2);
    fit=fit+bias;
end

if func_num==31
    X=X-0.5;
    fit=sum([1:D].*(X.^4))+rand;
    fit=fit+bias;
end

if func_num==32
    X=X-300;
    fit=sum(-X.*sin(sqrt(abs(X))));
end

if func_num==33
    X=X-2;
    fit=sum(X.^2-10*cos(2*pi.*X))+10*D;
    fit=fit+bias;
end

if func_num==34
    X=X-20;
    fit=-20*exp(-.2*sqrt(sum(X.^2)/D))-exp(sum(cos(2*pi.*X))/D)+20+exp(1);
    fit=fit+bias;
end

if func_num==35
    X=X-400;
    fit=sum(X.^2)/4000-prod(cos(X./sqrt([1:D])))+1;
    fit=fit+bias;
end

if func_num==36
    X=X-30;
    fit=(pi/D)*(10*((sin(pi*(1+(X(1)+1)/4)))^2)+sum((((X(1:D-1)+1)./4).^2).*...
        (1+10.*((sin(pi.*(1+(X(2:D)+1)./4)))).^2))+((X(D)+1)/4)^2)+sum(Ufun(X,10,100,4));
    fit=fit+bias;
end
if func_num==37
    X=X-30;
    fit=.1*((sin(3*pi*X(1)))^2+sum((X(1:D-1)-1).^2.*(1+(sin(3.*pi.*X(2:D))).^2))+...
        ((X(D)-1)^2)*(1+(sin(2*pi*X(D)))^2))+sum(Ufun(X,5,100,4));
    fit=fit+bias;
end
% if func_num==38     %%% cantilever beam design problem
%     y1= (61/(X(1)^3)) + (27/(X(2)^3)) + (19/(X(3)^3)) + (7/(X(4)^3))  +  (1/(X(5)^3))- 1;
% 
% fit = 0.06224*(X(1)+X(2)+X(3)+X(4)+X(5));
% 
% if y1 > 0
%    fit = fit+y1*10;
% end
% end
end
function fit=Ufun(X,a,k,m)
fit=k.*((X-a).^m).*(X>a)+k.*((-X-a).^m).*(X<(-a));
end