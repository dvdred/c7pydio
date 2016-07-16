TYPE=TRIGGERS
triggers='CREATE DEFINER=`pydiouser`@`%` TRIGGER `LOG_INSERT` AFTER INSERT ON `ajxp_index`\nFOR EACH ROW INSERT INTO ajxp_changes (repository_identifier, node_id,source,target,type)\n  VALUES (new.repository_identifier, new.node_id, \'NULL\', new.node_path, \'create\')' 'CREATE DEFINER=`pydiouser`@`%` TRIGGER `LOG_UPDATE` AFTER UPDATE ON `ajxp_index`\nFOR EACH ROW INSERT INTO ajxp_changes (repository_identifier, node_id,source,target,type)\n  VALUES (new.repository_identifier, new.node_id, old.node_path, new.node_path, CASE old.node_path = new.node_path WHEN true THEN \'content\' ELSE \'path\' END)' 'CREATE DEFINER=`pydiouser`@`%` TRIGGER `LOG_DELETE` AFTER DELETE ON `ajxp_index`\nFOR EACH ROW INSERT INTO ajxp_changes (repository_identifier, node_id,source,target,type)\n  VALUES (old.repository_identifier, old.node_id, old.node_path, \'NULL\', \'delete\')'
sql_modes=1436549152 1436549152 1436549152
definers='pydiouser@%' 'pydiouser@%' 'pydiouser@%'
client_cs_names='utf8' 'utf8' 'utf8'
connection_cl_names='utf8_general_ci' 'utf8_general_ci' 'utf8_general_ci'
db_cl_names='latin1_swedish_ci' 'latin1_swedish_ci' 'latin1_swedish_ci'
created=146869702345 146869702352 146869702337
