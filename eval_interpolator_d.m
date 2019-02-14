function N=eval_interpolator_d(tip,eps)
	load sunspot.dat
	xi=sunspot(:,1);
	fi=sunspot(:,2);
	if tip==1 p=@(x,y,z)valPolLagr(x,y,z);
        elseif tip==2 p=@(x,y,z)valPolNewton(x,y,z);
        elseif tip==3 p=@(x,y,z)SplineLiniar(x,y,z);
        elseif tip==4 p=@(x,y,z)SplineCubicN(x,y,z);
        elseif tip==5 p=@(x,y,z)SplineCubicT(x,y,z);
        elseif tip==6 p=@(x,y,z)Fourier(x,y,z);
	endif
	f=@(x0)exp(3*cos(x0))/(2*pi*besseli(0,3));
	g=@(x0)190.2/0.655*f(x0*2*pi/11)+11-1.3277;
	eroare0=0;
	x=linspace(1701,2000,1000+1);
        h=2*pi/(1000+1);
        k=2;N=4;
	dif=eps;N0=0;
        while 1
		n=round(linspace(1,300,N));
                eroare=sqrt(h)*norm(g(x)-p(x,xi(n)',fi(n)'),2);
                if abs(eroare-eroare0)<dif dif=abs(eroare-eroare0); N0=N;endif
                eroare0=eroare;
		k++;N=2^k;
		if(N>=300) break;endif
        endwhile
	if(dif==eps) N=inf;
	else N=N0;
	endif
endfunction
