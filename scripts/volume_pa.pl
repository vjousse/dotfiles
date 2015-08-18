#!/usr/bin/env perl 
#
#Based on http://askubuntu.com/questions/456842/check-pulseaudio-sink-volume
#one liner: pactl list sinks | perl -000ne 'if(/#1/){/(Volume:.*)/; print "$1\n"}'
#


## The sink we are interested in should be given as the 
## 1st argument to the script.
my $sink=$ARGV[0] || die("Need a sink number as the first argument.\n");
my $action=$ARGV[1] || die("Need an action to perform as second argument.\n");
## Eventually, a third argument can be passed, it's the step for
## increasing/decreasing the volume
my $step=$ARGV[2];

## Run the pactl command and save the output in 
## ther filehandle $fh
open(my $fh, '-|', 'pactl list sinks');

## Set the record separator to consecutive newlines (same as -000)
## this means we read the info for each sink as a single "line".
$/="\n\n";

## Go through the pactl output
while (<$fh>) {
    ## If this is the sink we are interested in
    if (/#$sink/) {
        ## Extract the current colume of this sink
        /Volume:.*?(\d+)%/;
        my $volume=$1;
        /Mute: (yes|no)/;
        my $mute=$1;

        if(!$step) {
            $step = 4;
        }

        if($action eq 'up') {
            ## By default, we want to unmute first when
            ## rise the volume up
            if($mute eq 'yes') {
                system("pactl set-sink-mute $sink 0")
            }

            system("pactl set-sink-volume $sink +$step%")

        } elsif($action eq 'down') {
            system("pactl set-sink-volume $sink -$step%")
        } elsif($action eq 'mute') {
            system("pactl set-sink-mute $sink 1")
        } elsif($action eq 'unmute') {
            system("pactl set-sink-mute $sink 0")
        }
    }
}
