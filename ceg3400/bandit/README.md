# Bandit

## level 0:
   - Using ``` ssh -p 2220 bandit0@bandit.labs.overthewire.org ``` password: bandit0, log into the system.
   - Then use ``` ls ``` to view the files on the system.
   - Use ``` cat readme ``` to view the new password for bandit1.
   - new password is ``` NH2SXQwcBdpmTEzi3bvBHMM9H66vVXjL ```

## level 1:
   - Use the ``` ssh -p 2220 bandit1@bandit.labs.overthewire.org ``` with the password found from bandit0 to log in.
   - Use the ``` ls ``` command to find what files are on the system.
   - Use ``` cat ./- ``` to view the "-" file to find the password.
   - The new password is ```rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi ```

## level 2:
   - Use the ``` ssh -p 2220 bandit2@bandit.labs.overthewire.org ``` with the password found from bandit1 file to log in.
   - Use the ``` ls ``` command to find the files on the system.
   - Use ``` cat "spaces in this filename" ``` to view the next password.
   - the new password is ``` aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG ```

## level 3:
   - Use the ``` ssh -p 2220 bandit3@bandit.labs.overthewire.org ``` with the password found from bandit2 file to log in.
   - Use the ``` ls ``` command to find what files are on the system.
   - Use the ``` ls -lah ``` command to view all files in the system in a human readable view, even the hidden files.
   - Use the ``` cd inhere ``` to change the directory to inhere.
   - Use the ``` ls -lah ``` command to view all files, even hidden files in the directory inhere.
   - Use ``` cat .hidden ``` to view the new password
   - the new password is ``` 2EW7BBsr6aMMoJ2HjW067dm8EgX26xNe ```

## level 4:
   - ``` lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR ``` is the new password.
   - ``` cat ./-file07``` I used cat ./<filename> over and over on each one until I found it in file 7

## level 5:
   - ``` find -type f -size 1033c ``` using the find command with the above parameters gave me maybehere07 as a target.
   - ``` cd maybehere07 ``` moved into the directory.
   - ``` ls -lah ``` showed me everything within the directory.
   - ``` cat .file2 ``` only file within the directory that had the password.
   - new password is ``` P4L4vucdmLnm8I7Vl7jG1ApGSfjYKqJU ```

## level 6:
   - cd down to the root level ``` cd .. <enter> cd .. <enter> ```
   - use ``` find -type f -size 33c -group bandit6 -user bandit7 ```
   - look through them until you find the one without "permission denied" on the end.
   - ```cat ./var/lib/dpkg/info/bandit7.password```showed me the new password.
   - password is ```z7WtoNQU2XfjmMtWA8u5rN4vzqu4v99S```

## level 7:
   - ```ls -lah``` showed me a text file called data.txt
   - ```cat data.txt``` showed me that there were many lines in the text, too many to parse through manually.
   - ``` cat data.txt | grep millionth ``` Using the hint, I used piped the cat of data.txt through grep for the word millionth and found the password.
   - the new password is ```TESKZC0XvTetK0S9xNwm25STk5iWrBvP ```

## level 8: 
   - ``` ls -lah ``` showed me that there was only one text file, data.txt
   - ``` cat data.txt ``` showed me lots of lines of hashes where it is too cluttered to go through them one by one.
   - ``` cat data.txt | sort | uniq -u ``` using this command, it allows me to sort through the data file, and find the only unique line to give me the new password.
   - ``` EN632PlfYiZbn3PhVK3XOGSlNInNE00t ``` is the new password.

## level 9:
   - using ``` ls -lah ``` I once again see only one file.
   - ``` cat data.txt ``` showes me lots of lines full of what looks like machine language or binary.
   - ``` strings data.txt | grep ===== ``` Using this command, strings first converts the file to human-readable, then following the hint, I added "=====" to ensure that what I got through the grep command would show me the password.
   - Thus, the new password is ``` G7w8LIi6J3kTb8A7j9LgrywtEUlyyp6s ```

## level 10:
   - ``` ls -lah ``` once again, shows me that there is only a data.txt on the file.
   - ``` cat data.txt ``` shows me what looks to be a hash, or encrypted data. From the hint, I know that it is encrypted data.
   - ``` base64 -d data.txt ``` is the command that the hint gave for decrypting the data. After looking up what the command does, and it's options, I used the -d option to decrypt the file; data.txt.
   - The new password is ``` 6zPeziLdR2RKNdNYFNb6nVCKzphlXHBM ```

## level 11:
   - Using ``` ls -lah ``` and from the hint, the file named data.txt is the file with the new password.
   - ``` cat data.txt ``` shows me that what appears to be gibberish. The hint tells me that all the letters from a-z and A-Z were rotated 13 postitions. Meaning this is a cyphertext. 
   - ``` cat data.txt | tr 'a-zA-Z' 'n-za-mN-ZA-N' ``` This command cats the data to the command line using the tr command to rotate the letters a-z and A-Z 13 postitions. Meaning that a = n and so forth. This gives me the new password.
   - The new password is ``` JVNBBFSmZwKKOP0XbFXOoW8chDz5yVRv ```

## level 12:
   - Using the hint, I used ``` mkdir /tmp/armlovich ``` to make a new file in the tmp directory
   - Using ``` cd /tmp/armlovich ``` I changed directory to the one I just made.
   - Then I copied the data file to the new directory using ``` cp ~/data.txt /tmp/armlovich/data.txt```
   - Looking up a hexdump program already installed, I found xxd so I used the command ``` xxd -r data.txt > data-undumbped ``` to un-hexdump the data into a new file. 
   - according to the hint, the new file data-undumped is a compressed file, so I renamed it as data.gz using ``` mv data-undumped data.gz ``` from what the internet said, the .gz allows me to use ``` gunzip data.gz ``` to un-compress the data within data.gz
   - Here I got lost, I used ``` file data ``` to find out that it is a bzip2 compressed data, block size = 900k.
   - I looked up ``` bzip ``` and found that I would have to use that on the file with the option -d to get a data.out file. The command was ``` bzip -d data ``` The output was: ``` Can't guess original name for data -- using data.out ```
   - I guessed that what I could do next was use the command ``` file data.out ``` and found out that the data was still compressed.
   - So, once again I used the command: ``` mv data.out data.gz ``` Then used ``` gunzip data.gz ``` to get the output file called data.
   - decided I needed to use ``` file data ``` to figure out if it was still compressed or not.
   - this time I had to look up what the output ``` data5.bin: POSIX tar archive (GNU) ``` meant. 
   - Then I used the command ``` tar -xf data ``` to get data5.bin. I then used ``` file data5.bin ``` followed by the same tar command to get data6.bin. Then I used the command: ``` file data6.bin ``` I found that it was again, a bzip compressed file. so rinse and repeat the bzip commands.
   - The output from using the bzip command and file command on the .out told me once again, that I needed to use the tar command on the .out file.
   - each time I used one of the commands above, I used ``` ls ``` to find out what the files were called. This time, the new file is called data8.bin. Which is, again, a compressed file with gzip. The full output from ``` file data8.bin ``` is: ```data8.bin: gzip compressed data, was "data9.bin", last modified: Thu Sep  1 06:30:09 2022, max compression, from Unix, original size modulo 2^32 49 ```
   - I renamed the data8.bin to data8.gz and used the ``` gunzip -d data8.gz ``` command to get the output of data8.
   - using ``` file data8 ``` I got an output that said ``` data8: ASCII text ```
   - Lastly, I used ``` cat data8 ``` to get the new password.
   - The new password is ``` wbWdlBxEir4CaE8LaPhauuOo6pwRmrDw ```

## level 13:
   - according to the hint, I will not be getting a new password, instead I will be getting a private SSH key that is to be used to log into the next level.
   - ``` ls -lah ``` shows me the file called sshkey.private
   - ``` cat sshkey.private ``` shows me the file to copy into my write-up and my bandit folder from which I will be using the private key to ssh into bandit 14.
   - the ssh key is : ``` -----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAxkkOE83W2cOT7IWhFc9aPaaQmQDdgzuXCv+ppZHa++buSkN+
gg0tcr7Fw8NLGa5+Uzec2rEg0WmeevB13AIoYp0MZyETq46t+jk9puNwZwIt9XgB
ZufGtZEwWbFWw/vVLNwOXBe4UWStGRWzgPpEeSv5Tb1VjLZIBdGphTIK22Amz6Zb
ThMsiMnyJafEwJ/T8PQO3myS91vUHEuoOMAzoUID4kN0MEZ3+XahyK0HJVq68KsV
ObefXG1vvA3GAJ29kxJaqvRfgYnqZryWN7w3CHjNU4c/2Jkp+n8L0SnxaNA+WYA7
jiPyTF0is8uzMlYQ4l1Lzh/8/MpvhCQF8r22dwIDAQABAoIBAQC6dWBjhyEOzjeA
J3j/RWmap9M5zfJ/wb2bfidNpwbB8rsJ4sZIDZQ7XuIh4LfygoAQSS+bBw3RXvzE
pvJt3SmU8hIDuLsCjL1VnBY5pY7Bju8g8aR/3FyjyNAqx/TLfzlLYfOu7i9Jet67
xAh0tONG/u8FB5I3LAI2Vp6OviwvdWeC4nOxCthldpuPKNLA8rmMMVRTKQ+7T2VS
nXmwYckKUcUgzoVSpiNZaS0zUDypdpy2+tRH3MQa5kqN1YKjvF8RC47woOYCktsD
o3FFpGNFec9Taa3Msy+DfQQhHKZFKIL3bJDONtmrVvtYK40/yeU4aZ/HA2DQzwhe
ol1AfiEhAoGBAOnVjosBkm7sblK+n4IEwPxs8sOmhPnTDUy5WGrpSCrXOmsVIBUf
laL3ZGLx3xCIwtCnEucB9DvN2HZkupc/h6hTKUYLqXuyLD8njTrbRhLgbC9QrKrS
M1F2fSTxVqPtZDlDMwjNR04xHA/fKh8bXXyTMqOHNJTHHNhbh3McdURjAoGBANkU
1hqfnw7+aXncJ9bjysr1ZWbqOE5Nd8AFgfwaKuGTTVX2NsUQnCMWdOp+wFak40JH
PKWkJNdBG+ex0H9JNQsTK3X5PBMAS8AfX0GrKeuwKWA6erytVTqjOfLYcdp5+z9s
8DtVCxDuVsM+i4X8UqIGOlvGbtKEVokHPFXP1q/dAoGAcHg5YX7WEehCgCYTzpO+
xysX8ScM2qS6xuZ3MqUWAxUWkh7NGZvhe0sGy9iOdANzwKw7mUUFViaCMR/t54W1
GC83sOs3D7n5Mj8x3NdO8xFit7dT9a245TvaoYQ7KgmqpSg/ScKCw4c3eiLava+J
3btnJeSIU+8ZXq9XjPRpKwUCgYA7z6LiOQKxNeXH3qHXcnHok855maUj5fJNpPbY
iDkyZ8ySF8GlcFsky8Yw6fWCqfG3zDrohJ5l9JmEsBh7SadkwsZhvecQcS9t4vby
9/8X4jS0P8ibfcKS4nBP+dT81kkkg5Z5MohXBORA7VWx+ACohcDEkprsQ+w32xeD
qT1EvQKBgQDKm8ws2ByvSUVs9GjTilCajFqLJ0eVYzRPaY6f++Gv/UVfAPV4c+S0
kAWpXbv5tbkkzbS0eaLPTKgLzavXtQoTtKwrjpolHKIHUz6Wu+n4abfAIRFubOdN
/+aLoRQ0yBDRbdXMsZN/jvY44eM+xRLdRVyMmdPtP8belRi2E2aEzA==
-----END RSA PRIVATE KEY----- ```
   - I copy and pasted this into my local system into a file called sshkey.private.
   - Then, to make the file useable, I needed to use the command: ``` chmod 600 sshkey.private ```
   - After exiting, I had to do was ssh in to bandit14 using the key from bandit13 using the command ``` ssh -i sshkey.private bandit14@bandit.labs.overthewire.org -p 2220 ```
   - after getting in, there was nothing in the file, so I checked the /etc file to see if it was there using ``` ls /etc ```
   - looking through the files and directories in /etc/ I found one called bandit_pass. I used ``` ls /etc/bandit_pass ``` to look at what was inside.
   - Inside I found files labeled bandit0 through bandit30. revisiting one of the earlier bandit levels I used ``` cat /etc/bandit_pass/<bandit#> ``` until I found one that would actually give me output other than: ``` permission denied ```
   - The new password was inside /etc/bandit_pass/bandit14 and is ``` fGrHPx402xGC7U7rXKDaxiWFTOiF0ENq ```

## level 14:
   - The hint tells me to use the password I found in bandit13 and submit it to port 30000 on my local computer to get the next password.
   - The command I had to use was ``` nc localhost 30000 ``` afterwards, I had to enter the password found above, and it gave me the new password.
   - The new password was ```jN2kgmIXJ6fShzhT2avhotn4Zcka6tnt ```
   - ![showing output for getting new password](bandit14_output.PNG)

## level 15:
   - I got lost here and stopped. 
