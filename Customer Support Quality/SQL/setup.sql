CREATE DATABASE cca;

USE cca;

CREATE TABLE teams (
    team_id INT PRIMARY KEY,
    team TEXT NOT NULL,
    department TEXT NOT NULL
);

CREATE TABLE tickets (
    ticket_id INT PRIMARY KEY,
    month TEXT NOT NULL,
    team_id INT NOT NULL,
    channel TEXT NOT NULL,
    resolution_hours INT NOT NULL,
    satisfaction INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

INSERT INTO teams (team_id,team,department) VALUES
('1','AccountCare','Service'),
('2','BillingHelp','Service'),
('3','AppSupport','Technical'),
('4','DeviceHelp','Technical');

INSERT INTO tickets (ticket_id, month, team_id, channel, resolution_hours, satisfaction) VALUES
(1, 'Jan', '1', 'Emals', 12, 4),
(2, 'Jan', '2', 'Chat', 28, 3),
(3, 'Jan', '3', 'Phone', 36, 2),
(4, 'Jan', '4', 'Email', 20, 4),
(5, 'Feb', '1', 'Chat', 8, 5),
(6, 'Feb', '2', 'Phone', 30, 3),
(7, 'Feb', '3', 'Email', 18, 4),
(8, 'Feb', '4', 'Chat', 40, 2),
(9, 'Mar', '1', 'Phone', 16, 4),
(10, 'Mar', '2', 'Email', 22, 4),
(11, 'Mar', '3', 'Chat', 32, 3),
(12, 'Mar', '4', 'Phone', 24, 5);



ticket_id,month,team_id,channel,resolution_hours,satisfaction
1,Jan,T1,Email,12,4
2,Jan,T2,Chat,28,3
3,Jan,T3,Phone,36,2
4,Jan,T4,Email,20,4
5,Feb,T1,Chat,8,5
6,Feb,T2,Phone,30,3
7,Feb,T3,Email,18,4
8,Feb,T4,Chat,40,2
9,Mar,T1,Phone,16,4
10,Mar,T2,Email,22,4
11,Mar,T3,Chat,32,3
12,Mar,T4,Phone,24,5
