function[Model2,minval,nmin,Mmin,Nmin]=ecstrs(theta,ett)
%The enchanced cstr in series model
%max r=11
r=11;
x=theta;
n=(0:1/r:1);
M=(0:1/r:1);
N=(1:1:r+1);
[x2,n2,M2,N2]=ndgrid(x,n,M,N);
d=(N2.*n2./M2.*x2);
Model=(1-n2).*dirac(d);

for i=1:1:r
        Model=Model+(N2.*n2./M2.*(factorial(N2).*exp(-d).*(d.^(i-1)).*((1-n2).^(N2-i)).*n2.^i))./(factorial((N2-i>0).*(N2-i)).*(factorial(i)).*(factorial(i-1)));
end
inf=isinf(Model);
Model(inf)=0;
nan=isnan(Model);
Model(nan)=0;
E=Modeltest(x,ett,Model);
[minval,minindex]=min(E(:));
[~,nmin,Mmin,Nmin]=ind2sub(size(E),minindex);
nmin=1/r*(nmin-1);
Mmin=(Mmin-1)/r;
d=(Nmin.*nmin./Mmin.*theta);
Model2=(1-nmin).*dirac(d);

for i=1:1:Nmin
        Model2=Model2+(Nmin.*nmin./Mmin.*(factorial(Nmin).*exp(-d).*(d.^(i-1)).*((1-nmin).^(Nmin-i)).*nmin.^i))./(factorial((Nmin-i>0).*(Nmin-i)).*(factorial(i)).*(factorial(i-1)));
end
inf=isinf(Model2);
Model2(inf)=0;
nan=isnan(Model2);
Model2(nan)=0;
end