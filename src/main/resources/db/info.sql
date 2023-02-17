<< PHP LUPPITER >>
http://10.217.17.21   DEV
http://10.217.192.13/login
http://10.217.192.15:7291  STG
http://14.63.254.139/login  PRD

-- 로그인 계정 
DEV : 
E1 / New1234!
e2 / New12345!

STG : 
E1 / Zmffkdnem3# 

PRD :
E1 / New1234!  운영도 로그인 됩니다.

<< GIT 주소 >>
java http://10.217.192.68:8443/91324083/project
php  http://10.217.192.68:8443/91318367/ktcloud_web

<< IP 정보 >>
192.168.227.217
192.168.227.1
147.6.44.44

<< 사용자 정보 >> 
정안호 91324083 192.168.227.217
임재홍 91318369 192.168.227.219
이혜빈 91318368 192.168.227.218
곽단  91324084 192.168.227.216
임소라 91324721 192.168.227.215

<< URL 정보 >>
KT cloud LUPPITER  => http://10.217.17.21
KT cloud Cloud-Bot => http://10.217.17.21/view/pod/ipc
KT cloud LUPPITER 장애View => http://10.217.17.21/view/mkt/mKate

<< nohup dev 실행 >> 
nohup /usr/lib/jdk-17/bin/java -jar ./stg_luppiter_20221230002.war & > /dev/null

login as: root
password root:
Last login: Tue Dec  6 18:38:58 2022 from 10.222.111.2
[root@p-mon-mk1-w03 ~]# cd /apache/tomcat/www
[root@p-mon-mk1-w03 www]# ll
total 1971148
drwxrwxr-x. 2 root root        31 Dec  6 18:42 logs
-rw-------. 1 root root 559644887 Dec  7 13:22 nohup.out
-rwxrwxr-x. 1 root root  41410637 Nov 28 15:23 uppiter_20221128001.war
-rwxrwxr-x. 1 root root  41411207 Nov 29 10:00 uppiter_20221129001.war
-rwxrwxr-x. 1 root root  41415390 Nov 29 13:11 uppiter_20221129002.war
-rwxrwxr-x. 1 root root  41423848 Dec  1 12:51 uppiter_20221201001.war
-rwxrwxr-x. 1 root root 157179379 Dec  5 14:57 uppiter_20221205001.war
-rwxrwxr-x. 1 root root 157187865 Dec  6 12:20 uppiter_20221206001.war
-rwxrwxr-x. 1 root root 157190848 Dec  6 16:59 uppiter_20221206002.war
-rwxrwxr-x. 1 root root 157190898 Dec  6 17:29 uppiter_20221206003.war
-rwxrwxr-x. 1 root root 157262331 Dec  6 18:37 uppiter_20221206004.war
-rwxrwxr-x. 1 root root 440171893 Dec  7 13:20 uppiter_20221207001.war
[root@p-mon-mk1-w03 www]# ps -ef | grep uppiter
root      6595  6285  0 13:25 pts/0    00:00:00 grep --color=auto uppiter
root     28235     1  0 Dec06 ?        00:02:42 /usr/lib/jdk-17/bin/java -jar ./uppiter_20221206004.war
[root@p-mon-mk1-w03 www]# kill -9 28235
[root@p-mon-mk1-w03 www]# nohup /usr/lib/jdk-17/bin/java -jar ./uppiter_20221207001.war & > /dev/null
[1] 6979
[root@p-mon-mk1-w03 www]# nohup: ignoring input and appending output to â€˜nohup.outâ€™

[root@p-mon-mk1-w03 www]#
