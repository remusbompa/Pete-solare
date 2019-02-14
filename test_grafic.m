function test_grafic()
	subplot(2,1,1);
	f=@(x)exp(3*cos(x))/(2*pi*besseli(0,3));
	x0=linspace(-pi,pi,1001);
	for tip=1:6
		if tip==1 p=@(x,y,z)valPolLagr(x,y,z);culoare='r';N=55;
                elseif tip==2 p=@(x,y,z)valPolNewton(x,y,z);culoare='m';N=56;
                elseif tip==3 p=@(x,y,z)SplineLiniar(x,y,z);culoare='y';N=256;
                elseif tip==4 p=@(x,y,z)SplineCubicN(x,y,z);culoare='g';N=64;
                elseif tip==5 p=@(x,y,z)SplineCubicT(x,y,z);culoare='b';N=64;
                elseif tip==6 p=@(x,y,z)Fourier(x,y,z);culoare='c';N=64;
                endif
		x=linspace(-pi,pi,N);
		hold on
		plot(x0,p(x0,x,f(x)),culoare);
		hold off
	endfor
	hold on
        fplot(f,[-pi pi],'k');
        title('Interpolare continua f(x):');
	legend('Lagrange','Newton','SplineLiniar','SplineCubicN','SplineCubicT','Fourier','f(x)');
	hold off
	load sunspot.dat
	fi=sunspot(:,2);
	xi=sunspot(:,1);
	subplot(2,1,2); 
	x0=linspace(1701,2000,1001);
	for tip=1:6
		tip
                if tip==1 p=@(x,y,z)valPolLagr(x,y,z);culoare='r';N=4;
                elseif tip==2 p=@(x,y,z)valPolNewton(x,y,z);culoare='m';N=4;
                elseif tip==3 p=@(x,y,z)SplineLiniar(x,y,z);culoare='y';N=256;
                elseif tip==4 p=@(x,y,z)SplineCubicN(x,y,z);culoare='g';N=256;
                elseif tip==5 p=@(x,y,z)SplineCubicT(x,y,z);culoare='b';N=256;
                elseif tip==6 p=@(x,y,z)Fourier(x,y,z);culoare='c';N=256;
                endif
		xc=round(linspace(1,300,N));
		hold on
                plot(x0,p(x0,xi(xc)',fi(xc)'),culoare);
		hold off
        endfor
	hold on
        plot(xi,fi,'k');
        title('Interpolare discreta fi:');
	legend('Lagrange','Newton','SplineLiniar','SplineCubicN','SplineCubicT','Fourier','fi');
	hold off
endfunction
