#!perl6

=begin pod

https://github.com/briandfoy/LearningPerl6_Downloads

For the exercise in the preface to Learning Perl 6. Use with the file
in "Data Files/Butterflys and Moths.txt".

Read the lines from the files specified on the command line. Print
the ones that contain Latin letters between underscores, like an
old school typewriter would represent italics. An example line we
should find:

	not quite up to their highest total. The _Noctuae_ and _Geometrae_ each


=end pod

# Perl 6 automatically calls MAIN for you after it compiles your
# program. It's argument list are the arguments from the command
# line.
#
# https://docs.perl6.org/language/functions#index-entry-MAIN
sub MAIN (*@*ARGS where .elems > 0 ) { # at least one argument
	for lines() -> $line {
		next unless $line ~~ / # a pattern
			:i  # the adverb for case insensitivity
			«   # left word boundary, so non-word before
			_     # underscore is stone age start of italics
			<[A..Z]>  # a genus starts with a capital Latin letter
			<[a..z]>+ # followed by lowercase Latin letters
			_     # underscore is stone age end of italics
			»   # right word boundary, so non-word after
			/;
		say $line;
		}
	}

# Perl 6 automatically calls USAGE if no MAIN signature matches
# That means that someone tried to call the program in a way you
# didn't handle
#
# https://docs.perl6.org/language/functions#index-entry-USAGE
sub USAGE {
	print q:to/HERE/;
	perl6 find_moths.p6 FILE1 [FILE2 [FILE3] ...]

	Specify one or more files on the command line and this program
	will print all of the lines containing the word moth.
	HERE
	}
