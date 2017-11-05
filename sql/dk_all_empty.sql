--mysql -uroot -p$DBPASS < newdb.sql

--CREATE USER 'dkuser'@'localhost' IDENTIFIED BY 'dkpasswd';
GRANT ALL ON *.* TO 'dkuser'@'%' IDENTIFIED BY 'dkpasswd';

DROP DATABASE IF EXISTS digikam_devel_core;
CREATE DATABASE digikam_devel_core;
GRANT ALL PRIVILEGES ON digikam_devel_core.* TO 'dkuser'@'%';

DROP DATABASE IF EXISTS digikam_devel_faces;
CREATE DATABASE digikam_devel_faces;
GRANT ALL PRIVILEGES ON digikam_devel_faces.* TO 'dkuser'@'%';

DROP DATABASE IF EXISTS digikam_devel_thumbs;
CREATE DATABASE digikam_devel_thumbs;
GRANT ALL PRIVILEGES ON digikam_devel_thumbs.* TO 'dkuser'@'%';

FLUSH PRIVILEGES;
