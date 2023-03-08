function pz = Project(z,theta)

M0 = max(size(theta));


for j=1:M0
 %each row is one projection angle
 pz(j,:) = sum(imrotate(z,-theta(j),'bilin','crop'));
end

