gf --path=/users/ud2017/local/share/x86_64-linux-ghc-7.8.4/gf-3.8/lib/alltenses/  -make -s MembersSQL.gf  MembersEng.gf
sleep 1
javac -cp .:jpgf.jar:java JavaShell.java
sleep 1
java -cp .:jpgf.jar:postgresql-9.4.1207.jar:java JavaShell Eng
