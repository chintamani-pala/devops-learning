# 🐧 Linux Command Practice – Solve in Terminal

## 🟢 LEVEL 1: Basics & Navigation

1. Show your **current directory**.
    ```
    pwd
    ```
    - Here `pwd` means present working directory.
2. List all files including **hidden files**.
    ```
    ls -a
    ```
    - Here `ls` means listing
    - Here `-a` means hidden files
3. List files in **long format** with human-readable sizes.
    ```
    ls -lah
    ```
    - Here `-l` means list in long format
    - Here `-a` means hidden files
    - Here `-h` means human readable format
4. Create a directory named `linux_practice`.
    ```
    mkdir linux_practice
    ```
    - Here `mkdir` means make a directory
5. Create nested directories:
   ```
   example -> linux_practice/day1/basics
   ```
   #### answer
   ```
   mkdir -p linux_practice/day1/basics
   ```
    - Here `-p` means parents -> Prevents "File Exists" Errors and "Creates Missing Parent Directories"

6. Navigate into `basics`.
    ```
    cd linux_practice/day1/basics
    ```
    - Here `cd` means change directory
7. Go back to your **home directory** in one command.
    ```
    cd ~/
    ```
    - Here `~/` means home directory 
8. Clear the terminal.
    ```
    clear
    ```
9. Display the **last command executed**.
    ```
    fc -ln -1
    ```
    - Here `fc` means "Fix Command" 
    - Here `-l` means lists the last 16 commands in your history 
    - Here `-n` means Suppresses the command numbers that normally appear on the left side of the history list.
10. Find your **username**.
    ```
    whoami
    ```

---

## 🟢 LEVEL 2: Files & Directories

11. Create a file named `file1.txt`.
    ```
    touch file1.txt
    ```
    - Here `touch` is used to create a file
12. Write the text `Linux is powerful` into `file1.txt`.
    ```
    echo 'Linux is powerful' > file1.txt
    ```
    - Here `echo` means display something 
    - Here `>` means redirect the output to a specific file
13. Display file content without opening an editor.
    ```
    cat file1.txt
    ```
    - Here `cat` is used to read a file
14. Copy `file1.txt` to `file2.txt`.
    ```
    cp file1.txt file2.txt
    ```
    - Here `cp` means copy
    - First argument is source and second is destination
15. Rename `file2.txt` to `linux.txt`.
    ```
    mv file2.txt linux.txt
    ```
    - Here `mv` means move
    - Same command is used for rename also(IMP)
16. Delete `linux.txt`.
    ```
    rm linux.txt
    ```
    - Here `rm` means remove
    - if you want to delete a directory use flag as -r 
        ```
        rm -r linux_practice
        ```
17. Create **10 empty files** using a single command.
    ```
    touch file{1..10}.txt
    ```
    - Here `{1..10}` is act like as a loop.
18. Delete all `.txt` files at once.
    ```
    rm file{1..10}.txt
    ```
    -  Here `rm` means remove
19. Count how many files exist in the directory.
    ```
    find . -type f | wc -l
    ```
    - Here `find` to find something in the same directory.
    - Here `.` means all
    - Here `-type f` means type is file
    - Here `|` means pass the output to another command as an input
    - Here `wc` means word count
    - Here `-l` means only line number
    ### or
    ```
    ls | wc -l 
    ```
    - Here `ls` means list all
    - Here `wc` means word count
    - Here `-l` means only line number
20. Find the **largest file** in the directory.
    ```
    ls -lS | head -n 2
    ```
    - Here `ls` means list all
    - Here `-l` use a long listing format
    - Here `|` means pass the output to another command as an input
    - Here `head` means from file starting
    - Here `-n 5` print the first 5 lines instead of the first 10(head default is 10 lines)
---

## 🟢 LEVEL 3: Search & Find

21. Find all `.log` files inside `./var/log`.
    ```
    cd .var./log && ls *.log -1
    ```
    - Here `ls` is taking a regex so i can pass `*.log`
22. Find files larger than **50MB**.
    ```
    find . -type f -size +50M
    ```
    - Here `find` to find something in the same directory.
    - Here `.` means all
    - Here `-type f` means type is file
    - Here `-size +50M` means more than 50MB
23. Find files modified in the **last 1 day**.
    ```
    find . -type f -mtime -1
    ```
    - Here `find` to find something in the same directory.
    - Here `.` means all
    - Here `-type f` means type is file
    - Here `-mtime -1` modified in `last 1 day` 
24. Search for the word `error` inside `/var/log/syslog`.
    ```
    awk '/error/' /var/log/syslog
    ```
    - `awk` is a powerful text-processing programming language used on Linux
    - `'/error/'` is the regex for `awk` 
25. Count how many times `error` appears.
    ```
    grep -o "error" file10.log | wc -l
    ```
    - Here `grep` means Global Regular Expression Print
    - Here `-o` means flag tells grep to print only the matching part of a line, rather than the entire line.
    - Here `wc -l` means word count print only line count

26. Display only **line numbers** where `error` occurs.
    ```
    awk '/error/{print NR}' file10.log
    ```
    - `awk` is a powerful text-processing programming language used on Linux
    - `'/error/{print}'` is the regex for `awk`
    - `NR` in `print` is show only `line numbers` 
27. Find files owned by `root`.
    ```
    find . -type f -user root
    ```
    - Here `find` to find something in the same directory.
    - Here `.` means all
    - Here `-type f` means type is file
    - Here `-user root` means file is owned by `root` user
28. Find files with **777 permissions**.
    ```
    ls -la | awk '/rwxrwxrwx/'
    ```
    - Here `ls -la` means print all files with hidden files
    - Here `awk '/rwxrwxrwx/'` means check 777 permissions
29. Redirect output of a command into a file.
    ```
    ls -la | awk '/rwxrwxrwx/' > test.log
    ```
    - Here `ls -la` means print all files with hidden files
    - Here `awk '/rwxrwxrwx/'` means check 777 permissions
    - Here `>` means redirect the output to a specific file
30. Append output of a command into the same file.
    ```
    ls -la | awk '/rwxrwxrwx/' >> test.log
    ```
    - Here `>>` means redirect the output to a specific file and append the output

---

## 🟡 LEVEL 4: Text Processing (Very Important)

31. Display only the **first 5 lines** of a file.
    ```
    head -n 5 test.log
    ```
    - Here `head` means from file starting
    - Here `-n 5` means first 5 line 
    - Here `test.log` is the file name
32. Display only the **last 10 lines**.
    ```
    tail -n 10 test.log
    ```
    - Here `tail` means from file ending
    - Here `-n 10` means last 10 line 
    - Here `test.log` is the file name
33. Show a file page by page.
    ```
    less test.log
    ```
    - Here `less` showing a file page by page
34. Extract only the **3rd column** from a file.
    ```
    awk '{print $3}' test.log
    ```
35. Sort a file alphabetically.
    ```
    sort test.log
    ```
    ### or 
    send to other file
    ```
    sort test.log > test1.log
    ```
36. Sort a file numerically.
    ```
    sort -nr test.log
    ```
     - here `-n` meand numeric sort 
     - here `-r` means reverse
     
37. Remove duplicate lines.
    ```
    sort test.log | uniq
    ```
    - Here `uniq` to filter unique lines, but `uniq` is working best with `sort` sorted texts. 
38. Count total number of lines in a file.
    ```
    cat test.log | wc -l
    ```
    - Here `cat` is used to read a file
    - Here `wc -l` means word count print only line count

39. Show only lines that start with `ERROR`.
    ```
    grep "^ERROR" test.log
    ```
    - Here `grep` means Global Regular Expression Print
    - Here "^ERROR" means starting with ERROR.
40. Show only lines that do **not** contain `INFO`.
    ```
    grep -v "INFO" filename.log
    ```
    - Here `grep` means Global Regular Expression Print
    - Here `-v` means invert match

---

## 🟡 LEVEL 5: Permissions & Ownership

41. Check file permissions.
42. Give **read, write, execute** permission to owner only.
43. Give execute permission to everyone.
44. Remove write permission from group.
45. Change file owner to `root`.
46. Change group ownership.
47. Find files with **SUID bit** set.
48. Explain output of `ls -l` (by practice).
49. Set permission using numeric mode.
50. Check default permission using `umask`.

---

## 🟡 LEVEL 6: Users & Groups

51. Create a user named `dev_user`.
52. Set password for `dev_user`.
53. Create a group named `dev_team`.
54. Add `dev_user` to `dev_team`.
55. Switch to `dev_user`.
56. Display current logged-in users.
57. Show user ID and group ID.
58. Lock a user account.
59. Delete a user without deleting home directory.
60. List all users in the system.

---

## 🔵 LEVEL 7: Process Management

61. Show all running processes.
62. Show processes for a specific user.
63. Find PID of `sshd`.
64. Kill a process using PID.
65. Kill a process by name.
66. Show real-time process usage.
67. Run a command in background.
68. Bring a background job to foreground.
69. Change priority of a running process.
70. Find top 5 CPU consuming processes.

---

## 🔵 LEVEL 8: Networking

71. Display IP address.
72. Check if google.com is reachable.
73. Show all listening ports.
74. Find which process is using port 8080.
75. Download a file from internet.
76. Display DNS information.
77. Check active network connections.
78. SSH into a remote server.
79. Copy file to remote server.
80. Test open port on remote server.

---

## 🔴 LEVEL 9: Disk & Memory

81. Check disk usage.
82. Check directory size.
83. Show mounted file systems.
84. List block devices.
85. Show memory usage.
86. Show CPU info.
87. Find large files consuming disk.
88. Clean package cache.
89. Mount a filesystem.
90. Unmount a filesystem.

---

## 🔴 LEVEL 10: Logs & System

91. View system logs using journalctl.
92. View logs from previous boot.
93. Monitor logs in real-time.
94. Check system uptime.
95. Check OS version.
96. Find failed login attempts.
97. Check cron jobs.
98. Restart a service.
99. Enable a service at boot.
100. Reboot system safely.
