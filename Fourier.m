function val=Fourier(x0,x,y)
	n=(length(x)-1)/2;
	a0=0;
	for k=0:2*n-1
		a0+=y(k+1);
	endfor
	a0=a0/(n*2);
	for i=1:n
		a(i)=0;
		for k=0:2*n-1
			a(i)+=y(k+1)*cos(i*x(k+1));
		endfor
		a(i)/=n;
	endfor
	 for i=1:n
                b(i)=0;
                for k=0:2*n-1
                        b(i)+=y(k+1)*sin(i*x(k+1));
                endfor
                b(i)/=n;
        endfor
	val=a0;
	for k=1:n
		val+=a(k)*cos(k*x0)+b(k)*sin(k*x0);
	endfor
endfunction
		
