function OPT_z=Goldindec(A,p,peak_ratio,eps,path)
y=A(:,2);
n=A(:,1);
%eps=0.0001;
a=0;
b=1;
udr=T_rate(peak_ratio);
s=a+0.382*(b-a);
z=LEGEND_C(y,n,p,s);
up_down_rate=length(find(y>=z))/length(find(y<z));
t=0;
while abs(up_down_rate-udr)>eps
    OLD_s=s;
    if up_down_rate-udr>eps
        a=s;
        s=a+0.382*(b-a);
        z=LEGEND_C(y,n,p,s);
        up_down_rate=length(find(y>=z))/length(find(y<z));
    else 
        b=s;
        s=a+0.382*(b-a);
        z=LEGEND_C(y,n,p,s);
        up_down_rate=length(find(y>=z))/length(find(y<z));
    end
    if abs(OLD_s-s)<0.00001
        break;
    end
    t=t+1;
end
OPT_s=s;
OPT_z=LEGEND_C(y,n,p,OPT_s);
%Draw 
[n,i]=sort(n);
y=y(i);
Baseline=[A(:,1) OPT_z];
xlswrite(path,Baseline);
%background=background(i);
OPT_z=OPT_z(i);
plot(n,y,n,OPT_z)
result = A - Baseline

plot(result)















