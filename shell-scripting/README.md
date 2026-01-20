# Shell Scripting Learning

This directory contains various shell scripts used for learning and automating common DevOps tasks.

## Script Overview

| Script Name | Purpose | Key Concepts |
| :--- | :--- | :--- |
| `3_idiots.sh` | Introduction to variables and user input. | Variables, `read`, environment variables. |
| `hello_chatur.sh` | File and directory operations. | `mkdir`, `touch`, `echo` to file. |
| `check_if_user_exist.sh`| Checks if a specific user exists on the system. | `/etc/passwd`, `grep`, `wc`, conditionals. |
| `create_user.sh` | Interactive user creation with password. | `useradd`, `passwd` with `echo`. |
| `create_user_with_args.sh`| Non-interactive user creation using arguments. | Positional parameters `$1`, `$2`. |
| `delete_user.sh` | Deletes a user and verifies removal. | `userdel`, verification logic. |
| `install_package.sh` | Installs system packages using `apt`. | Package management, `sudo`, `apt`. |

---

## Detailed Usage

### 1. User Management

#### Create User (Interactive)
Run the script and follow the prompts:
```bash
./create_user.sh
```

#### Create User (with Arguments)
Provide the username and password as arguments:
```bash
./create_user_with_args.sh myuser mypassword
```

#### Delete User
Deletes the user and checks `/etc/passwd` to confirm:
```bash
./delete_user.sh
```

### 2. Package Installation
Install any package by passing its name:
```bash
./install_package.sh docker.io
```

### 3. Fun Learning
Experiments with scripts based on "3 Idiots" movie themes:
- `3_idiots.sh`: Asks about Rancho's real name.
- `hello_chatur.sh`: Creates a directory named `rancho` and a file named `farhanitrate.txt`.

---

## Prerequisites
- Most scripts require `sudo` privileges for user management and package installation.
- Ensure scripts have execution permissions:
```bash
chmod +x *.sh
```
