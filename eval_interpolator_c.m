function N=eval_interpolator_c(tip,eps)
	f=@(x)exp(3*cos(x))/(2*pi*besseli(0,3));
	if tip==1 p=@(x,y,z)valPolLagr(x,y,z);
	elseif tip==2 p=@(x,y,z)valPolNewton(x,y,z);
	elseif tip==3 p=@(x,y,z)SplineLiniar(x,y,z);
	elseif tip==4 p=@(x,y,z)SplineCubicN(x,y,z);
	elseif tip==5 p=@(x,y,z)SplineCubicT(x,y,z);
	elseif tip==6 p=@(x,y,z)Fourier(x,y,z);
	endif 
	eroare0=0;
	x=linspace(-pi,pi,1000+1);
        h=2*pi/(1000+1);
	
	if tip==1 || tip==2
		N=4;
		while 1
        		n=linspace(-pi,pi,N);
			eroare=sqrt(h)*norm(f(x)-p(x,n(1:N),f(n(1:N))),2);
			if (!eroare0 || eroare<eroare0) && abs(eroare-eroare0)<eps break; endif
            		eroare0=eroare;
			N++;
			if tip==1 && N>55 N=inf; break;
			elseif tip==2 && N>56 N=inf; break;
			endif
		endwhile
	elseif tip==6
	               N=5;
                while 1
                        n=linspace(-pi,pi,N);
                        eroare=sqrt(h)*norm(f(x)-p(x,n(1:N),f(n(1:N))),2);
                        if (!eroare0 || eroare<eroare0) && abs(eroare-eroare0)<eps break; endif
                        eroare0=eroare;
                        N+=2;
                endwhile
	else
        	k=2;N=4;
		while 1
			n=linspace(-pi,pi,N);
			eroare=sqrt(h)*norm(f(x)-p(x,n(1:N),f(n(1:N))),2);
			if (!eroare0 || eroare<eroare0) && abs(eroare-eroare0)<eps break; endif
			eroare0=eroare;
			k++;N=2^k;
		endwhile
	endif
endfunction
