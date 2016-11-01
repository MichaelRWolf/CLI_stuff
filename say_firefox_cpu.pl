#!/usr/bin/perl -w
# say_firefox_cpu.pl --- say the Firefox CPU percentage
# Author: Michael R. Wolf <MichaelRWolf@att.net>
# Created: 31 Oct 2016
# Version: 0.01

use warnings;
use strict;

my $sleep_seconds = 5;
my $ff_high_threshhold = 80;

sub ff_cpu {
    my $ps_pipe_command = join(q{ | },
                               q{ps -A -o%cpu -ocommand},
                               q{grep -v 'grep'},
                               q{grep '/Applications/Firefox.app/Contents/MacOS/firefox'});

    open my $ps_fh, , q{-|}, $ps_pipe_command
        or die "Cannot open ps(1) pipeline: $!";

    my $ff_ps_line = <$ps_fh>;
    chomp $ff_ps_line;
    my ($ff_cpu, $ff_command) = split ' ', $ff_ps_line;
    return $ff_cpu;
}


sub say_ff_cpu {
    my $say_rate = 400;         # words/minute

    my $ff_cpu_raw = ff_cpu();
    my $ff_cpu = sprintf '%i', $ff_cpu_raw;

    # Precise below 20%, by 10's afterwards...
    my $ff_cpu_rounded = $ff_cpu < 20 ? $ff_cpu : (int($ff_cpu / 10) * 10);

    open my $say_fh, q{|-}, "say --rate=$say_rate"
        or die "Cannot open say(1) pipeline: $!";

    print "firefox CPU $ff_cpu_rounded\n";
    if ( $ff_cpu_rounded > $ff_high_threshhold) {
        print ${say_fh} "firefox $ff_cpu_rounded"
    }
}

sub main {
    say_ff_cpu();
}

main;

__END__

=head1 NAME

say_firefox.pl - Describe the usage of script briefly

=head1 SYNOPSIS

say_firefox.pl [options] args

      -opt --long      Option description

=head1 DESCRIPTION

Stub documentation for say_firefox.pl, 

=head1 AUTHOR

Michael R. Wolf, E<lt>MichaelRWolf@att.netE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by Michael R. Wolf

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.2 or,
at your option, any later version of Perl 5 you may have available.

=head1 BUGS

None reported... yet.

=cut
