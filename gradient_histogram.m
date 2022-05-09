function histogram = gradient_histogram(grad_x, grad_y)
angle = atan2(grad_y,grad_x);   %calculating angles
angle2= angle(:);               %reshaping to vector
grad_y2=grad_y(:);              %reshaping to vector
grad_x2=grad_x(:);

bin1 = 0; bin2 = 0; bin3 = 0; bin4 = 0; bin5 =0; bin6=0; bin7=0; bin8=0;

for i=1:length(angle2)
        if angle2(i) >= 0 & angle2(i) < pi/4
            mag=sqrt(grad_y2(i)^2+grad_x2(i)^2);
            bin8=bin8 + mag;  %saves the magnitude for bin8
        end
            
        if   angle2(i) >= pi/4 & angle2(i) < pi/2
            mag=sqrt(grad_y2(i)^2+grad_x2(i)^2);
            bin7=bin7 + mag;  
        end
        if   angle2(i) >= pi/2 & angle2(i) < 3*pi/4
            mag=sqrt(grad_y2(i)^2+grad_x2(i)^2);
            bin6=bin6 + mag;  
        end
        if   angle2(i) >= 3*pi/4 & angle2(i) < pi
            mag=sqrt(grad_y2(i)^2+grad_x2(i)^2);
            bin5=bin5 + mag;  
        end
        
        if   angle2(i) >= -pi & angle2(i) < -3*pi/4
            mag=sqrt(grad_y2(i)^2+grad_x2(i)^2);
            bin4=bin4 + mag;  
        end
        
        if   angle2(i) >= -3*pi/4 & angle2(i) < -pi/2
            mag=sqrt(grad_y2(i)^2+grad_x2(i)^2);
            bin3=bin3 + mag;   
        end
        
        if   angle2(i) >= -pi/2 & angle2(i) < -pi/4
            mag=sqrt(grad_y2(i)^2+grad_x2(i)^2);
            bin2=bin2 + mag;  
        end
        
        if   angle2(i) >= -pi/4 & angle2(i) <0
            mag=sqrt(grad_y2(i)^2+grad_x2(i)^2);
            bin1=bin1 + mag; 
        
end
        
histogram = [bin1; bin2; bin3; bin4; bin5; bin6; bin7; bin8 ]; %creating the histogram vector

end