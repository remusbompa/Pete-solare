function val=valPolLagr(x0,x,y)
	n=length(x);
	val=0;
	for k=1:n
		produs=y(k);
		for i=1:n
			if i!=k
				produs.*=(x0-x(i))/(x(k)-x(i));
			endif
		endfor
		val+=produs;
	endfor
endfunction
