# misc_tools
Lots of small utilities that are useful and geeky :-D

## dd.pl
I've done many many years ago a small tool to replace the standard unix command dd in perl.
Why? Because the standard dd was too slow for my purpose! And in perl it was running FAST!

The goal of this command is only to extract part of a file, something like you would do in dd:

```$ dd if=sourcefile of=targetfile bs=length count=1 skip=offset```

So now the syntax is simply

```$ dd.pl sourcefile targetfile offset length```

Example: 

```$ dd.pl myfiles.out myfile.pdf 12893 1299```

