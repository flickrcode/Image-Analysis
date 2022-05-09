function pts_tilde =outlier_addition(outlier_rate,pts_tilde,K)
outlier2=K*outlier_rate/100
outlier1=K-outlier2
pts_tilde(1:2,outlier1+1:end)= [480;640].*rand(2,outlier2)
end