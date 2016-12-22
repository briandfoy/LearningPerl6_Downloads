#!perl6

=begin pod

For the exercise in the preface to Learning Perl 6.

Read the lines from the files specified on the command line. Print
the ones that contain Latin letters between underscores, like an
old school typewriter would represent italics.

=end pod

# Perl 6 automatically calls MAIN for you after it compiles your
# program. It's argument list are the arguments from the command
# line.
#
# https://docs.perl6.org/language/functions#index-entry-MAIN
sub MAIN (*@) { # Signature says there has to be at least one argument
	for lines() -> $line {
		next unless $line ~~ / # a pattern
			:i  # the adverb for case insensitivity
			«   # left word boundary
			_     # underscore is stone age start of italics
			<[A..Z]>  # a genus starts with a capital Latin letter
			<[a..z]>+ # followed by lowercase Latin letters
			_     # underscore is stone age end of italics
			»   # right word boundary
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
