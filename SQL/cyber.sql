
select* from Cleaned_Cybersecurity_attacks

--Calculate Average Anomaly Scores
SELECT 
    AVG(Anomaly_Scores) AS Avg_Anomaly_Score
FROM 
    Cleaned_Cybersecurity_attacks


--Count of Network Events:
SELECT 
    count(Destination_IP_Address) AS Network_Events
FROM 
    Cleaned_Cybersecurity_attacks



--Calculate Average Packet Length:
SELECT 
    AVG(packet_length) AS Avg_Packet_Length
FROM 
    Cleaned_Cybersecurity_attacks
WHERE 
    packet_length IS NOT NULL;


--Count of Malware Indicators by Day
SELECT 
    CAST(Timestamp AS DATE) AS Day, 
    COUNT(Malware_Indicators) AS Malware_Count
FROM 
    Cleaned_Cybersecurity_attacks
where Malware_Indicators = 'IoC Detected'
GROUP BY 
    CAST(Timestamp AS DATE)

ORDER BY 
    Day;



--Average Anomaly Scores by Day
SELECT 
    CAST(Timestamp AS DATE) AS Day, 
    AVG(Anomaly_Scores) AS Avg_Anomaly_Score
FROM 
    Cleaned_Cybersecurity_attacks
GROUP BY 
    CAST(Timestamp AS DATE)
ORDER BY 
    Day;


--Count of Attacks by Year and Month
SELECT 
    YEAR(Timestamp) AS Year, 
    MONTH(Timestamp) AS Month, 
    COUNT(Destination_IP_Address) AS Attack_Count
FROM 
    Cleaned_Cybersecurity_attacks
GROUP BY 
    YEAR(Timestamp), 
    MONTH(Timestamp)
ORDER BY 
    Year, Month;


--Count of Attacks by Action Taken
SELECT 
    Action_Taken, 
    COUNT(Destination_IP_Address) AS Action_Count
FROM 
  Cleaned_Cybersecurity_attacks
GROUP BY 
    Action_Taken;

--Top Targeted Destination Ports
SELECT Top 10
    destination_port, 
    COUNT(Destination_IP_Address) AS Attack_Count
FROM 
   Cleaned_Cybersecurity_attacks
GROUP BY 
    destination_port
ORDER BY 
    Attack_Count DESC




--Count of Attacks by Traffic Type
SELECT 
    traffic_type, 
    COUNT(Source_IP_Address) AS Attack_Count
FROM 
    Cleaned_Cybersecurity_attacks
GROUP BY 
    traffic_type;


--Average Packet Length by Attack Type
SELECT 
    attack_type, 
    AVG(packet_length) AS Avg_Packet_Length
FROM 
 Cleaned_Cybersecurity_attacks
GROUP BY 
    attack_type;