%Name of the student: Saad Bin Abdul Mannan
%Matriculation Number: 6897506
%Course: Electrical Systems Engineering
%Homework on Modeling and Simulation problem sheet 1


%1(a)
help zeros
 zeros  Zeros array.
    zeros(N) is an N-by-N matrix of zeros.
 
    zeros(M,N) or zeros([M,N]) is an M-by-N matrix of zeros.
 
    zeros(M,N,P,...) or zeros([M N P ...]) is an M-by-N-by-P-by-... array of
    zeros.
 
    zeros(SIZE(A)) is the same size as A and all zeros.
 
    zeros with no arguments is the scalar 0.
 
    zeros(..., CLASSNAME) is an array of zeros of class specified by the
    string CLASSNAME.
 
    zeros(..., 'like', Y) is an array of zeros with the same data type, sparsity,
    and complexity (real or complex) as the numeric variable Y.
 
    Note: The size inputs M, N, and P... should be nonnegative integers. 
    Negative integers are treated as 0.
 
    Example:
       x = zeros(2,3,'int8');




%1(b)
help ones
 ones   Ones array.
    ones(N) is an N-by-N matrix of ones.
 
    ones(M,N) or ones([M,N]) is an M-by-N matrix of ones.
 
    ones(M,N,P,...) or ones([M N P ...]) is an M-by-N-by-P-by-... array of
    ones.
 
    ones(SIZE(A)) is the same size as A and all ones.
 
    ones with no arguments is the scalar 1.
 
    ones(..., CLASSNAME) is an array of ones of class specified by the 
    string CLASSNAME.
 
    ones(..., 'like', Y) is an array of ones with the same data type, sparsity,
    and complexity (real or complex) as the numeric variable Y.
 
    Note: The size inputs M, N, and P... should be nonnegative integers. 
    Negative integers are treated as 0.
 
    Example:
       x = ones(2,3,'int8');




%1(c)
help rand
 rand Uniformly distributed pseudorandom numbers.
    R = rand(N) returns an N-by-N matrix containing pseudorandom values drawn
    from the standard uniform distribution on the open interval(0,1).  rand(M,N)
    or rand([M,N]) returns an M-by-N matrix.  rand(M,N,P,...) or
    rand([M,N,P,...]) returns an M-by-N-by-P-by-... array.  rand returns a
    scalar.  rand(SIZE(A)) returns an array the same size as A.
 
    Note: The size inputs M, N, P, ... should be nonnegative integers.
    Negative integers are treated as 0.
 
    R = rand(..., CLASSNAME) returns an array of uniform values of the 
    specified class. CLASSNAME can be 'double' or 'single'.
 
    R = rand(..., 'like', Y) returns an array of uniform values of the 
    same class as Y.
 
    The sequence of numbers produced by rand is determined by the settings of
    the uniform random number generator that underlies rand, RANDI, and RANDN.
    Control that shared random number generator using RNG.
 
    Examples:
 
       Example 1: Generate values from the uniform distribution on the
       interval [a, b].
          r = a + (b-a).*rand(100,1);
 
       Example 2: Use the RANDI function, instead of rand, to generate
       integer values from the uniform distribution on the set 1:100.
          r = randi(100,1,5);
 
       Example 3: Reset the random number generator used by rand, RANDI, and
       RANDN to its default startup settings, so that rand produces the same
       random numbers as if you restarted MATLAB.
          rng('default')
          rand(1,5)
 
       Example 4: Save the settings for the random number generator used by
       rand, RANDI, and RANDN, generate 5 values from rand, restore the
       settings, and repeat those values.
          s = rng
          u1 = rand(1,5)
          rng(s);
          u2 = rand(1,5) % contains exactly the same values as u1
 
       Example 5: Reinitialize the random number generator used by rand,
       RANDI, and RANDN with a seed based on the current time.  rand will
       return different values each time you do this.  NOTE: It is usually
       not necessary to do this more than once per MATLAB session.
          rng('shuffle');
          rand(1,5)

%1(d) 
a = zeros(1,5)

a =

     0     0     0     0     0
     
%1(e)
a = ones(3,1)

a =

     1
     1
     1

%1(f)
a = [1:5,pi]

a =

    1.0000    2.0000    3.0000    4.0000    5.0000    3.1416

%1(g)
a = [(1/10)*(1:3)]'

a =

    0.1000
    0.2000
    0.3000

%1(h)
a = [3:3:27]

a =

     3     6     9    12    15    18    21    24    27
     
%1(i)
linspace(6,6,10)

ans =

     6     6     6     6     6     6     6     6     6     6

%1(j)
a = rand(3,3)

a =

    0.8147    0.9134    0.2785
    0.9058    0.6324    0.5469
    0.1270    0.0975    0.9575

%1(k)
a = [1:2; 3:4; 5:6]

a =

     1     2
     3     4
     5     6

%1(l)
size(a)

ans =

     3     2

%1(m)
a = [1,10*(2:3);10*(4:6);10*(7:9)]

a =

     1    20    30
    40    50    60
    70    80    90

%1(n)
a'

ans =

     1    40    70
    20    50    80
    30    60    90

%1(0)
b = a'

b =

     1    40    70
    20    50    80
    30    60    90

>> b(3,2)

ans =

    60

%1(p)
b(2,:)

ans =

    20    50    80

%1(q)
b(:,3)

ans =

    70
    80
    90

%1(r)
a = [1:3;4:6;7:9]

a =

     1     2     3
     4     5     6
     7     8     9

>> b = a

b =

     1     2     3
     4     5     6
     7     8     9

%1(s)
c = a+b

c =

     2     4     6
     8    10    12
    14    16    18

%1(t)
c = a*b

c =

    30    36    42
    66    81    96
   102   126   150

%1(u)
c = a.*b

c =

     1     4     9
    16    25    36
    49    64    81

%1(v)
a = [3 1 1;1 3 1;1 1 3]

a =

     3     1     1
     1     3     1
     1     1     3

>> b = [8;10;12]

b =

     8
    10
    12

>> x = inv(a)*b

x =

    1.0000
    2.0000
    3.0000
%1(w)
x = a\b

x =

    1.0000
    2.0000
    3.0000

%2(a)
sqrt(6897506)

ans =

   2.6263e+03

%2(b)
a = [11 7 32 34 13 6897506]

a =

          11           7          32          34          13     6897506

%2(c)
a(end)

ans =

     6897506

%2(d)
b = a(3:end)

b =

          32          34          13     6897506

%2(e)
min(a)

ans =

     7

%2(f)
max(a)

ans =

     6897506

%2(g)
mean(a)

ans =

   1.1496e+06
   
%2(h)
sum(a)

ans =

     6897603
     
%2(i)
sqrt(a)

ans =

   1.0e+03 *

    0.0033    0.0026    0.0057    0.0058    0.0036    2.6263

%2(j)
sort(a)

ans =

           7          11          13          32          34     6897506


%2(k)
p = [1 4 -5 6 -9];
>> r = roots(p)

r =

  -5.2364 + 0.0000i
   1.2008 + 0.0000i
   0.0178 + 1.1963i
   0.0178 - 1.1963i




%3(a)
a = 2+3i

a =

   2.0000 + 3.0000i
%3(b)
real(a)

ans =

     2
%3(c)
imag(a)

ans =

     3
%3(d)
conj(a)

ans =

   2.0000 - 3.0000i

%3(e)
i

ans =

   0.0000 + 1.0000i

%4(a)
help plot
 plot   Linear plot. 
    plot(X,Y) plots vector Y versus vector X. If X or Y is a matrix,
    then the vector is plotted versus the rows or columns of the matrix,
    whichever line up.  If X is a scalar and Y is a vector, disconnected
    line objects are created and plotted as discrete points vertically at
    X.
 
    plot(Y) plots the columns of Y versus their index.
    If Y is complex, plot(Y) is equivalent to plot(real(Y),imag(Y)).
    In all other uses of plot, the imaginary part is ignored.
 
    Various line types, plot symbols and colors may be obtained with
    plot(X,Y,S) where S is a character string made from one element
    from any or all the following 3 columns:
 
           b     blue          .     point              -     solid
           g     green         o     circle             :     dotted
           r     red           x     x-mark             -.    dashdot 
           c     cyan          +     plus               --    dashed   
           m     magenta       *     star             (none)  no line
           y     yellow        s     square
           k     black         d     diamond
           w     white         v     triangle (down)
                               ^     triangle (up)
                               <     triangle (left)
                               >     triangle (right)
                               p     pentagram
                               h     hexagram
                          
    For example, plot(X,Y,'c+:') plots a cyan dotted line with a plus 
    at each data point; plot(X,Y,'bd') plots blue diamond at each data 
    point but does not draw any line.
 
    plot(X1,Y1,S1,X2,Y2,S2,X3,Y3,S3,...) combines the plots defined by
    the (X,Y,S) triples, where the X's and Y's are vectors or matrices 
    and the S's are strings.  
 
    For example, plot(X,Y,'y-',X,Y,'go') plots the data twice, with a
    solid yellow line interpolating green circles at the data points.
 
    The plot command, if no color is specified, makes automatic use of
    the colors specified by the axes ColorOrder property.  By default,
    plot cycles through the colors in the ColorOrder property.  For
    monochrome systems, plot cycles over the axes LineStyleOrder property.
 
    Note that RGB colors in the ColorOrder property may differ from
    similarly-named colors in the (X,Y,S) triples.  For example, the 
    second axes ColorOrder property is medium green with RGB [0 .5 0],
    while plot(X,Y,'g') plots a green line with RGB [0 1 0].
 
    If you do not specify a marker type, plot uses no marker. 
    If you do not specify a line style, plot uses a solid line.
 
    plot(AX,...) plots into the axes with handle AX.
 
    plot returns a column vector of handles to lineseries objects, one
    handle per plotted line. 
 
    The X,Y pairs, or X,Y,S triples, can be followed by 
    parameter/value pairs to specify additional properties 
    of the lines. For example, plot(X,Y,'LineWidth',2,'Color',[.6 0 0]) 
    will create a plot with a dark red line width of 2 points.
 
    Example
       x = -pi:pi/10:pi;
       y = tan(sin(x)) - sin(tan(x));
       plot(x,y,'--rs','LineWidth',2,...
                       'MarkerEdgeColor','k',...
                       'MarkerFaceColor','g',...
                       'MarkerSize',10)

%4(b)
x = -2*pi:0.1:2*pi;
y = exp(x);
plot(x,y)

%4(c)
x = 0:0.1:2*pi;
y = log(x);
plot(x,y)
