package DDG::Spice::Bbc;

# ABSTRACT: BBC guide on when something is showing

use DDG::Spice;

primary_example_queries "what's on bbc";
secondary_example_queries "what's on bbc three", "what is on bbc two";
description "Find out what's on a BBC show";
name "BBC";
icon_url "/i/bbc.co.uk.ico";
source "BBC";
code_url "https://github.com/duckduckgo/zeroclickinfo-spice/blob/master/lib/DDG/Spice/Bbc.pm";
topics "everyday";
category "entertainment";
attribution github => ['https://github.com/tophattedcoder','Tom Bebbington'];
spice to => 'http://www.bbc.co.uk/$1/programmes/schedules/$3/today.json';
spice from => '([^\/]+)(\/([^\/]+))?';
spice wrap_jsonp_callback => 1;
spice proxy_cache_valid => "200 304 1d";

triggers any => "schedule", "what's on", "tv guide", "now on", "bbc";#

# Handle statement
handle query_lc => sub {
	# Check for and remove trigger words
	s/\s*(schedule|what's on|tv guide|now on)\s*//g;
	return ('worldserviceradio', '') if($_ =~ /^bbc world (service|radio|service radio)?$/);
	return ('asiannetwork', '') if($_ =~ /^bbc asian network?$/);
	return ('6music', '') if($_ =~ /^bbc radio (6|six)( music)?$/);
	return ('5livesportsextra', '') if($_ =~ /^bbc radio (5|five)( live)? extra$/);
	return ('5live', '') if($_ =~ /^bbc radio (5|five)( live)?$/);
	return ('radio4extra', '') if($_ =~ /^bbc radio (4|four) e?xtra$/);
	return ('radio4', '') if($_ =~ /^bbc radio (4|four)$/);
	return ('radio3', '') if($_ =~ /^bbc radio (3|three)$/);
	return ('radio2', '') if($_ =~ /^bbc radio (2|two)$/);
	return ('1xtra', '') if($_ =~ /^bbc radio (1|one) e?xtra$/);
	return ('radio1', 'england') if($_ =~ /^bbc radio( 1| one)?$/);
	return ('bbcalba', '') if($_ =~ /^(bbc )?alba$/);
	return ('parliament', '') if($_ =~ /^(bbc )?parliament$/);
	return ('bbcnews', '') if($_ =~ /^bbc news$/);
	return ('cbeebies', '') if($_ =~ /^cbeebies$/);
	return ('cbbc', '') if($_ =~ /^cbbc$/);
	return ('bbcfour', '') if($_ =~ /^bbc (4|four)$/);
	return ('bbcthree', '') if($_ =~ /^bbc (3|three)$/);
	return ('bbctwo', 'england') if($_ =~ /^bbc (2|two)?$/);
	return ('bbcone', 'london') if($_ =~ /^bbc( 1| one)?$/);
	return;
};
1;
