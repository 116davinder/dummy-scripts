#!/usr/bin/python
###############################################################
#               install sshpass package using apt-get/yum
################################################################
# stdin, stdout, stderr = ssh.exec_command("sudo -S reboot")   #
# stdin.write("<password>\n")                      #
# stdin.flush()                                                #
################################################################
# result = stdout.read().splitlines()                          #
################################################################

from socket import socket, gethostbyname, AF_INET, SOCK_STREAM, setdefaulttimeout
from subprocess import Popen, PIPE
import paramiko, time, sys
import re
import os

hostname = '10.10.0.13'
port = 22
username = 'root'
password = 'sdfs!2jkDFCP@'
migrate_user= 'grux'
def ssh_exec(sp,exec_str):
     stdin, stdout, stderr = sp.exec_command(exec_str)
     exec_err = stderr.read()
     if len(exec_err) != 0:
      print exec_err
     else:
      print "Ok"

def ssh_exec_r(sp,exec_str):
     stdin, stdout, stderr = sp.exec_command(exec_str)
     exec_err = stderr.read()
     if len(exec_err) != 0:
      print exec_err
     else:
      return (stdout.read())

def check_port(fhostname,fport,ftimeout):
     setdefaulttimeout(ftimeout)
     fs = socket(AF_INET, SOCK_STREAM)
     result = fs.connect_ex((fhostname, fport))
     if(result == 0) :
      print 'Port %d is open' % (fport,)
     else :
      print 'Port %d is closed' % (fport,)
     fs.close()
     return result

print 'copying user values from local system'
file = open("/etc/passwd", "r")
for line in file.readlines():
    if re.search('grux'+':x'+'*'+'/bin/bash', line, re.I):
        pw_line= line #nav:x:1002:1002:Navdeep:/home/nav:/bin/bash
        file.close()
file = open("/etc/shadow", "r")
for line in file.readlines():
    if re.search('grux'+'*', line, re.I):
        sh_line = line  #grux:$6$VRQaGqq5$YDHsagmmFTSv/Of3UFUd5eOxY2C9R.rwi/VxYFdT.YXAfPCV/rAign0UYIkGx2lgkdTYXeHsAqqlPho.nWsjz0:17040:0:99999:7:::
        file.close()
file = open("/etc/gshadow", "r")
for line in file.readlines():
    if re.search('grux'+':!::', line, re.I):
        gsh_line = line   #nav:!::
        file.close()
file = open("/etc/group", "r")
for line in file.readlines():
    if re.search('grux'+':'+'*'+':', line, re.I):
        gr_line = line    #nav:x:1002:
        file.close()
file = open ("/etc/sudoers", "r")
for line in file.readlines():
#    print line
    if re.search('grux'+'*', line, re.I):
        s_line = line  #nav ALL=(ALL) NOPASSWD:ALL
   
print '\nvalues are listed below \n'
print 'value copied from passwd file is \n'
print pw_line
print 'value copied from shadow file is \n'
print sh_line
print 'value copied from gshadow file is\n '
print gsh_line
print 'value copied from group file is\n'
print gr_line
print 'value copied from sudoers file is \n'
print s_line

print 'Making Tar of Home under /root folder'
tar1= "tar -zcvpf /root/"+str(migrate_user)+".tar.gz /home/"+str(migrate_user)
os.system(tar1)  ################################################### issue creating tar of specific user only
print 'Copying Home tar to Remote Machine'
#####################################################
cpy1= "sshpass -p"+password" scp -r /root/"+str(migrate_user)".tar.gz root@"+hostname+":/root"
os.system(cpy1)
######################## creating shell command for remote execution
t1_pass="echo " + str(pw_line) +" >> /etc/passwd"
t1_shad="echo " + str(sh_line) +" >> /etc/shadow"
t1_gshad="echo " + str(gsh_line) +" >> /etc/gshadow"
t1_grp="echo " + str(gr_line) +" >> /etc/group"
t1_sudo="echo " + str(s_line) +" >> /etc/sudoers"
##################################### tar2 for extracting tar to remote server command
tar2="tar -xf "+str(migrate_user)+ " -C /home"
###################################### permission command
per1= "chown -R "+str(migrate_user)+":"+str(migrate_user)+" /home"+str(migrate_user)
#####################################
if __name__ == "__main__":
 if (check_port(hostname,port,5) != 0) :
  sys.exit("This server $hostname is not accessible on the 22 port")
# # Initialization of ssh connection
 paramiko.util.log_to_file('paramiko.log')
 s = paramiko.SSHClient()
 s.load_system_host_keys()
 s.set_missing_host_key_policy(paramiko.AutoAddPolicy())
 s.connect(hostname, port, username, password)
  
 print "\nPutting values to Remote Server\n"
 print 'Inserting Value to passwd file'
 ssh_exec(s,t1_pass)
 print 'Inserting Value to shadow file'
 ssh_exec(s,t1_shad)
 print 'Inserting Value to Group file'
 ssh_exec(s,t1_grp)
 print 'Inserting Value to Sudoers file'
 ssh_exec(s,t1_sudo)
 print 'Inserting Value to GSHADOW file'
 ssh_exec(s,t1_gshad)
 print '\nExtracting Tar Folder to Home'
 ssh_exec(s,tar2)
 print '\n Setting Permissions'
 ssh_exec(s,per1)
 s.close()
# output=proc.communicate()[0]
# print ''Output=, output
# print output
