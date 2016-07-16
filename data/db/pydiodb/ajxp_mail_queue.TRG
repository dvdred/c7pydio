TYPE=TRIGGERS
triggers='CREATE DEFINER=`pydiouser`@`%` TRIGGER `mail_queue_go_to_sent` BEFORE DELETE ON `ajxp_mail_queue`\nFOR EACH ROW INSERT INTO ajxp_mail_sent (recipient,url,date_event,notification_object,html) VALUES (old.recipient,old.url,old.date_event,old.notification_object,old.html)'
sql_modes=1436549152
definers='pydiouser@%'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='latin1_swedish_ci'
created=146869702259
