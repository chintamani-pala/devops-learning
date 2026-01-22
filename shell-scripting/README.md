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
| `backup.sh` | Periodic backup and sync to AWS S3. | `zip`, `date`, `aws s3 sync`. |
| `for_loop.sh` | Demonstration of for loops. | `for`, syntax, iteration. |
| `functions_test.sh` | Demonstration of functions in shell scripts. | `function`, reusable code, loop integration. |

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

### 3. Backups
Automate directory backups and sync them to an S3 bucket:
```bash
./backup.sh <source_directory> <destination_directory>
```
*Note: Requires AWS CLI configured with appropriate permissions.*

#### AWS CLI Setup Guide
Follow these steps to configure your environment for backups:

1. **Create IAM User**:
   - Visit the [AWS IAM Console](https://console.aws.amazon.com/iam/).
   - Add a new user with **S3 Full Access** permissions.
2. **Security Credentials**:
   - Create and download an **Access Key ID** and **Secret Access Key** for the user.
3. **Configure Terminal**:
   - Run the configuration command:
     ```bash
     aws configure
     ```
   - Input your access keys and preferred region.
4. **Verify Configuration**:
   - Check your identity:
     ```bash
     aws sts get-caller-identity
     ```
   - List your S3 buckets:
     ```bash
     aws s3 ls
     ```

> [!TIP]
> To sync a directory directly without the script, use:
> `aws s3 sync <source_directory> s3://<your-bucket-name>`

#### Scheduling Backups with Cron
To automate the backup script, use `cron`:

1. Open the crontab editor:
   ```bash
   crontab -e
   ```
2. Add a line to schedule the backup (e.g., every day at 2 AM):
   ```bash
   0 2 * * * /path/to/shell_scripting/backup.sh /source/dir /dest/dir
   ```
   > [!IMPORTANT]
   > Always use **absolute paths** for the script and directories in crontab.

---

### 4. Learning Loops and Functions
- **Loops**: `for_loop.sh` demonstrates a simple for loop.
- **Functions**: `functions_test.sh` shows how to define and use functions.


### 5. Fun Learning
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
