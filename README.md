# Launch Digikam in a controlled environment

The scripts allow to run Digikam in a debug environment which doesn't tamper with your main Digkam configuration and main SQL database

## Prerequisites

Add 

    export DBPASS=<rootpasswd for your sql server>

to .bashrc and restart bash

Run

    create_new_user

to create a user dkuser with sufficient privileges for digikam

## Scripts

The scripts provide a pristine copy of digikamrc with a connection to a MYSQL db. A Sample collection is installed in /tmp/digikam-debug-pics


### digikam
* copy new digikamrc with MYSQL connection
* launch digikam

### digikam_with_empty_db
* copy new digikamrc with MYSQL connection
* create new databases for core, thumbs, face
* launch digikam

### digikam_with_albumroot
* copy new digikamrc with MYSQL connection
* create new databases for core, thumbs, face
* use a predefined albumroot (/tmp/digikam-debug-pics) and populate with 3 sample images
* launch digikam

### digikam_with_sample_db
* copy new digikamrc with MYSQL connection
* create new databases for core, thumbs, face
* use a predefined albumroot (/tmp/digikam-debug-pics) and populate with 3 sample images
* add a tag hierarchy
* launch digikam

## Generation of sql scripts
1) ./digikam_with_empty_db
1) add collections on network shares: /tmp/digikam-debug-pics
1) mysqldump -udkuser -pdkpasswd digikam_devel_core > sql/dk_core_albumroot.sql
1) add labels Lifesavers, Lifesavers->blue, Lifesavers->red, Monkey
1) add one star on blue lifesaver and monkey
1) mysqldump -udkuser -pdkpasswd digikam_devel_core > sql/dk_core_sample.sql

## Credentials
* Login:  dkuser
* Passwd: dkpasswd

## Warning

The scripts are developer tools and have no error checking. Read first the scripts in order to understand what they do




