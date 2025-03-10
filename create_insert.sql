CREATE TABLE viols (
    tr_viol_id  BIGINT PRIMARY KEY,                     
    viol_code   INTEGER NOT NULL,                       
    time_check  TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    stage_code  INTEGER NOT NULL,                     
    refuse_code INTEGER NOT NULL,                       
    camera_id   INTEGER NOT NULL                     

CREATE TABLE opers (
    viol_oper_id  BIGINT PRIMARY KEY,                 
    tr_viol_id    BIGINT NOT NULL,                       
    oper_code     INTEGER NOT NULL,                    
    refuse_code   INTEGER NOT NULL,                     
    isp_id        BIGINT NOT NULL,                      
    date_oper     TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, 
    viol_datetime TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, 
    CONSTRAINT fk_opers_viols FOREIGN KEY (tr_viol_id) REFERENCES viols (tr_viol_id) ON DELETE CASCADE
);

INSERT INTO viols (tr_viol_id, viol_code, time_check, stage_code, refuse_code, camera_id) VALUES
(1, 101, '2018-04-01 10:15:00', 1, 0, 5),
(2, 102, '2018-04-01 12:30:00', 2, 1, 8),
(3, 103, '2018-04-02 14:45:00', 1, 0, 3),
(4, 104, '2018-04-03 09:20:00', 3, 0, 2),
(5, 105, '2018-04-04 16:10:00', 2, 1, 7),
(6, 101, '2018-04-05 11:05:00', 1, 0, 6),
(7, 102, '2018-04-06 13:25:00', 2, 0, 9),
(8, 103, '2018-04-07 15:40:00', 1, 0, 4),
(9, 104, '2018-04-08 08:55:00', 3, 1, 1),
(10, 105, '2018-04-09 17:30:00', 2, 0, 10);


INSERT INTO opers (viol_oper_id, tr_viol_id, oper_code, refuse_code, isp_id, date_oper, viol_datetime) VALUES
(1, 1, 29, 0, 1001, '2018-04-01 11:00:00', '2018-04-01 10:15:00'),
(2, 2, 15, 1, 1002, '2018-04-01 13:00:00', '2018-04-01 12:30:00'),
(3, 3, 29, 0, 1003, '2018-04-02 15:00:00', '2018-04-02 14:45:00'),
(4, 4, 10, 1, 1004, '2018-04-03 10:00:00', '2018-04-03 09:20:00'),
(5, 5, 20, 1, 1005, '2018-04-04 17:00:00', '2018-04-04 16:10:00'),
(6, 6, 29, 0, 1006, '2018-04-05 12:00:00', '2018-04-05 11:05:00'),
(7, 7, 5, 1, 1007, '2018-04-06 14:00:00', '2018-04-06 13:25:00'),
(8, 8, 29, 0, 1008, '2018-04-07 16:00:00', '2018-04-07 15:40:00'),
(9, 9, 10, 1, 1009, '2018-04-08 09:30:00', '2018-04-08 08:55:00'),
(10, 10, 15, 0, 1010, '2018-04-09 18:00:00', '2018-04-09 17:30:00');
