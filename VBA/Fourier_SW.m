%*************************************************************************%
% Title:        Fourier Series
% Description: 
%       Inputs:
%              coefnum - Number of Coefficients
%              eq - Number of Function
%       Outputs:
%              Plot of the function and fourier series
%              Display of Coefficients
% Filename: Fourier_SW.m
% Version: v00.01
% Author: Paul Vincent Sablan
% Yr&Sec: BSCS 4-4
% Subject: Digital Speech and Audio Signal Processing (DSAP)
%*************************************************************************%

function Fourier_SW(coefnum,eq)
   syms x; 
    switch eq
        
        case 1
            
            signal = {sin(x), 0, pi, .5, pi, 2*pi};        
            series = getFSeries(signal,coefnum);
            printCoef(series,coefnum);
            plotsignal(series, coefnum,signal);

        case 2
            signal = {x^2, -pi, pi, -1, -1, -1};        
            series = getFSeries(signal,coefnum);
            printCoef(series,coefnum);
            plotsignal(series, coefnum,signal);

        case 3
            signal = {-x+1, 0, pi, 0, pi, 2*pi};        
            series = getFSeries(signal,coefnum);
            printCoef(series,coefnum);
            plotsignal(series, coefnum,signal);
        case 4

            signal = {x, 0, pi, pi, pi, 2*pi};        
            series = getFSeries(signal,coefnum);
            printCoef(series,coefnum);
            plotsignal(series, coefnum,signal);
            
        case 5

            signal = {x, 0, pi, -1, pi, 2*pi};        
            series = getFSeries(signal,coefnum);
            printCoef(series,coefnum);
            plotsignal(series, coefnum,signal);
    otherwise
        fprintf('Invalid Input');

    end
end 

    
    %***************printCoef******************%
    function printCoef(series,coefnum)
       n = 1;
       fprintf('\t\tThe Coeffiecient are: ');
        for index = 1:1:coefnum;
            
            fprintf('\n\t\tC%d\t %.3f', index-1, series(n));    
            n = n +1;
        end
        fprintf('\n');
    end
    %***************printCoef******************%
    

    %*****************Function plotsignal*********************%
    function plotsignal(series, coefnum,signal)
        
        p = coefnum;
        Freq = 1/p;
        T = 1/Freq;
        t = 0:0.001:T*4;
        y = funcPlot(t,T,signal);
        
        subplot(2,1,1);
        plot(t,y);
        hold on;
        subplot(2,1,2);
        stem(series);
        hold on;

    
    end
    
     %***************Function showSiganl******************%

    function y = funcPlot(t,T,signal)
    
    for i=1:length(t)
        if mod(t(i),T) <= T/2
            y(i) =  signal{1};
        else
            y(i) = signal{4};
        end
    end
end
    %***************Function gegSeriesValue*******************%
    
    function fseries = getFSeries(signal, number)
        
        sig = signal;
        n = number;
        coef = zeros(1,n);
        
        for index = 1:1:n
            if index == 1
                coef(index) = getA0Value(sig);
            else
                coef(index) = getAnValue(sig, index) + getBnValue(sig, index);
               
            end
       
        end
        
        fseries = coef;
        
    end
   
     %***************Function gegSeriesValue****************%

 %***************Function getAnValue***************************%
    function anvalue = getAnValue(sig, index)
        
        if sig{4} == -1
            x = sym('x');
            n = index;
             f1 = sig{1};
            baseperiod = 1/pi;
            strtpt = sig{2};
            frequency = sig{3};
            approxarea = baseperiod*int(f1*cos(n*x),x,strtpt,frequency);
             anvalue = approxarea;
        else
            
            x = sym('x');
            n = index;
            baseperiod = 1/pi;

            strtpt = sig{2};
            frequency = sig{5};
            period = sig{6};

            f1 = sig{1};
            f2 = sig{4}*ones(size(x));

      
            approxarea = baseperiod*int(f1*cos(n*x),x,strtpt,frequency)+ baseperiod*int(f2*cos(n*x), x, frequency, period);
        anvalue =approxarea;
            
            
        end
        
    end
      %***************Function gegAnValue*******************%


%***************Function getBnValue*****************************%
% get the the cosine Coefficient of the signal given the period T
%    from bn = 1 up to n
    function bnvalue = getBnValue(sig, index)
        
        
        if sig{4} == -1
            x = sym('x');
            n = index;
             f1 = sig{1};
            baseperiod = 1/pi;
            strtpt = sig{2};
            frequency = sig{3};
            approxarea = baseperiod*int(f1*sin(n*x),x,strtpt,frequency);
             bnvalue = approxarea;
        else
            
            x = sym('x');
            n = index;
            baseperiod = 1/pi;

            strtpt = sig{2};
            frequency = sig{5};
            period = sig{6};

            f1 = sig{1};
            f2 = sig{4}*ones(size(x));

      
            approxarea = baseperiod*int(f1*sin(n*x),x,strtpt,frequency)+ baseperiod*int(f2*sin(n*x), x, frequency, period);
        bnvalue =approxarea;
            
            
        end
       
    end
   %***************Function gegSeriesValue*******************%



%***************Function getA0Value********************************%
% Get the  coefficient of the signal at a = 0 given the period T 
%   from an = 1 up to n
    function a0value = getA0Value(sig)
        
       if sig{4} == -1
            x = sym('x');
             f1 = sig{1};
            baseperiod = 1/pi;
            strtpt = sig{2};
            frequency = sig{3};
            approxarea = baseperiod*int(f1,x,strtpt,frequency);
             a0value = approxarea/2;
        else
            
             x = sym('x');
            baseperiod = 1/pi;

            strtpt = sig{2};
            frequency = sig{5};
            period = sig{6};

            f1 = sig{1};
            f2 = sig{4}*ones(size(x));

      
            approxarea = baseperiod*int(f1,x,strtpt,frequency) + baseperiod*int(f2, x, frequency, period);
            a0value = approxarea/2;
            
            
        end
        
    end