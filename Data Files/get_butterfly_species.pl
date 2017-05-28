#!/Users/brian/bin/perls/perl5.14.2
use v5.10.1;
use utf8;
use strict;
use warnings;

# Perl 6's LWP::Simple can't handle this site because there's some
# invalid UTF-8
my @sites = (
	'http://www.learnaboutbutterflies.com/Species%20index%20-%20Mexico,%20USA%20&%20Canada.htm',
	'http://www.learnaboutbutterflies.com/Species%20index%20-%20temperate%20Asia.htm',
	'http://www.learnaboutbutterflies.com/Species%20index%20-%20Oriental.htm',
	'http://www.learnaboutbutterflies.com/Species%20index%20-%20Australia,%20Papua%20&%20NZ.htm',
	'http://www.learnaboutbutterflies.com/Species%20index%20-%20Africa.htm',
	'http://www.learnaboutbutterflies.com/Species%20index%20-%20Amazon%20&%20Andes.htm',
	'http://www.learnaboutbutterflies.com/Species%20index%20-%20Europe.htm',
	'http://www.learnaboutbutterflies.com/Species%20index%20-%20Britain.htm',
	);

use Mojo::UserAgent;

my $ua = Mojo::UserAgent->new;

my %hash;
foreach my $site ( @sites ) {
	my @species =
		grep { /\A[A-Z]\S+\s[a-z]{2,}\z/ }
			$ua
				->get( $site )
				->res
				->dom
				->find( 'td a > font[color=#0000FF]' )
				->map( 'text' )
				->each
				;

	@hash{@species} = (1) x @species;
	}

foreach my $key ( sort keys %hash ) {
	say $key;
	}
