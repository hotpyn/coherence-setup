#!/usr/bin/perl

use File::Next;

if($ARGV[1] eq "")
{
	print "ARGV[1] missing. Please provide new name for module.\n";
	exit;
}

if($ARGV[2] eq "")
{
	print "ARGV[2] missing. Please provide new name for module (small).\n";
	exit;
}

my $iterator = File::Next::files( $ARGV[0] );

while ( defined ( my $file = $iterator->() ) ) 
{
	print "$file\n";
	open(IN,$file); @data=<IN>; close(IN);
	for($j=0; $j<=$#data; $j++)
	{
		$data[$j]=~s/CoherenceDemo/$ARGV[1]/g;
		$data[$j]=~s/coherence_demo/$ARGV[2]/g;
	}
	open(OUT,">$file"); print OUT @data; close(OUT);
}

`mv $ARGV[0]/lib/coherence_demo $ARGV[0]/lib/$ARGV[2]`;
`mv $ARGV[0]/lib/coherence_demo.ex $ARGV[0]/lib/$ARGV[2].ex`;
`mv $ARGV[0]/lib/coherence_demo_web $ARGV[0]/lib/$ARGV[2]_web`;
`mv $ARGV[0]/lib/coherence_demo_web.ex $ARGV[0]/lib/$ARGV[2]_web.ex`;
