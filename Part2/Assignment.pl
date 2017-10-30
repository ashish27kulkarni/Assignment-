#!/usr/bin/perl

use DBI;
use strict;


my $dbh = DBI->connect("dbi:SQLite:assignment.db");

print "Database Connection Successful\n";

my $stmt = qq(SELECT * FROM data;);
my $sth = $dbh->prepare($stmt);
my $rv = $sth -> execute() or die $DBI::errstr;

if ($rv < 0){
	print $DBI::errstr;
}

while(my @row = $sth->fetchrow_arrow()){
	print "First Name = ".$row[0]." | ";
	print "Last Name = ".$row[1]." | ";
	print "Home = ".$row[2]."\n";
}
print "Database selection successful";
$dbh->disconnect();


