-- S2a — Average resolution time by department
SELECT 
    t.department,
    ROUND(AVG(tk.resolution_hours), 2) AS avg_resolution_hours
FROM tickets tk
JOIN teams t ON tk.team_id = t.team_id
GROUP BY t.department
ORDER BY avg_resolution_hours DESC;

-- S2b — Teams breaching SLA (avg > 24 hours)
SELECT 
    t.team_id,
    t.team,
    t.department,
    ROUND(AVG(tk.resolution_hours), 2) AS avg_resolution_hours
FROM tickets tk
JOIN teams t ON tk.team_id = t.team_id
GROUP BY t.team_id, t.team, t.department
HAVING AVG(tk.resolution_hours) > 24
ORDER BY avg_resolution_hours DESC;

-- S2c — Top two channels by breach count
SELECT 
    channel,
    COUNT(*) AS breach_count
FROM tickets
WHERE resolution_hours > 24
GROUP BY channel
ORDER BY breach_count DESC, channel ASC
LIMIT 2;

-- S3 — Data Integrity Check (Diagnostic Query)
SELECT 
    t.team_id,
    t.team,
    t.department,
    COUNT(tk.ticket_id) AS total_tickets
FROM teams t
LEFT JOIN tickets tk ON t.team_id = tk.team_id
GROUP BY t.team_id, t.team, t.department;