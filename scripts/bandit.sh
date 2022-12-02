#!/bin/bash

ssh -p 2220 bandit0@bandit.labs.overthewire.org
   print.out "bandit0"
      cat readme
      cat readme | grep 'N' | cp > password.txt

      ssh -p 2220 bandit1@bandit.labs.overthewire.org
         cat password.txt | print.out
	 cat ./- | grep 'rR' | cp > password.txt

	 ssh -p 2220 bandit2@bandit.labs.overthewire.org
	    cat password.txt | print.out
	    cat "spaces in this filename" | grep 'aB' | cp > password.txt

	    ssh -p 2220 bandit3@bandit.labs.overthewire.org
	       cat password.txt | print.out
	       cd inhere
	       cat .hidden | grep '2E' | cp > password.txt

	       ssh -p 2220 bandit4@bandit.labs.overthewire.org
	          cat password.txt | print.out
		  
