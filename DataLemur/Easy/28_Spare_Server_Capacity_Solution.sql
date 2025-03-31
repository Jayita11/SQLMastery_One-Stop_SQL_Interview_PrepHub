SELECT d.datacenter_id,
       d.monthly_capacity - SUM(fd.monthly_demand) AS spare_capacity
FROM datacenters d 
INNER JOIN forecasted_demand fd 
ON d.datacenter_id = fd.datacenter_id
GROUP BY d.datacenter_id, d.monthly_capacity
ORDER BY  d.datacenter_id, spare_capacity;