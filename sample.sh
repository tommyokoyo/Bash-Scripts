#This is my code editor file
sample_function ()
{
    echo 'The sample function was called and returned 1'
    return 1
}

cron_files_check ()
{
    cron_allow='./cron.allow'
    at_allow='./at.allow'

    if [ -e "$cron_allow" ] && [ -e "$at_allow" ];then
        echo "[OK]: cron.allow file exist."
        echo "[OK]: at.allow file exist."
        read -p "[Alert]: Files Exist, do you want to overwrite with root access only? (yes/no): " user_answer

        if [ $user_answer == 'yes' ];then
            echo "[OK]: Configuring cron files..."
            sample_function
            if [ $? -eq 0 ]; then
                echo '[OK]: Configuration Complete'
                return 0
            else
                echo '[FAILED]: Configuration failed'
                return 1
            fi
        elif [ $user_answer == 'no' ];then
            echo "[OK]: Skipping cron file configuration"
            return 0
        else
            echo "[ERROR]: Unknown Answer"
            echo "[OK]: Skipping cron file configuration"
            return 0
        fi
    else
        if [ -e "$cron_allow" ];then
            echo "[ALERT]: cron.allow file exist"
            if [ -e "$at_allow" ];then
                echo "[ALERT]: at.allow file exist"
                read -p "[Alert]: Files Exist, do you want to overwrite with root access only? (yes/no): " user_answer

                if [ $user_answer == 'yes' ];then
                    echo "[OK]: Configuring cron files..."
                    sample_function
                    if [ $? -eq 0 ]; then
                        echo '[OK]: Configuration Complete'
                        return 0
                    else
                        echo '[FAILED]: Configuration failed'
                        return 1
                    fi
                elif [ $user_answer == 'no' ];then
                    echo "[OK]: Skipping cron file configuration"
                    return 0
                else
                    echo "[ERROR]: Unknown Answer"
                    echo "[OK]: Skipping cron file configuration"
                    return 0
                fi
            else
                echo "[ALERT]: at.allow file doesn't exist"
                read -p "[Alert]: create at.allow file? Note: This process will overwrite both at.allow and cron.allow with root access only? (yes/no): " user_answer

                if [ $user_answer == 'yes' ];then
                    echo "[OK]: Configuring cron files..."
                    sample_function
                    if [ $? -eq 0 ]; then
                        echo '[OK]: Configuration Complete'
                        return 0
                    else
                        echo '[FAILED]: Configuration failed'
                        return 1
                    fi
                elif [ $user_answer == 'no' ];then
                    echo "[OK]: Skipping cron file configuration"
                    return 0
                else
                    echo "[ERROR]: Unknown Answer"
                    echo "[OK]: Skipping cron file configuration"
                    return 0
                fi
            fi
        else
            echo "[ALERT]: cron.allow file doesn't exist"
            if [ -e "$at_allow" ];then
                echo "[ALERT]: at.allow file exist"
                read -p "[Alert]: create cron.allow file? Note: This process will overwrite both at.allow and cron.allow with root access only? (yes/no): " user_answer

                if [ $user_answer == 'yes' ];then
                    echo "[OK]: Configuring cron files..."
                    sample_function
                    if [ $? -eq 0 ]; then
                        echo '[OK]: Configuration Complete'
                        return 0
                    else
                        echo '[FAILED]: Configuration failed'
                        return 1
                    fi
                elif [ $user_answer == 'no' ];then
                    echo "[OK]: Skipping cron file configuration"
                    return 0
                else
                    echo "[ERROR]: Unknown Answer"
                    echo "[OK]: Skipping cron file configuration"
                    return 0
                fi
            else
                echo "[ALERT]: at.allow file doesn't exist"
                read -p "[Alert]: cron.allow and at.allow not found. Create both files with root access only? (yes/no): " user_answer

                if [ $user_answer == 'yes' ];then
                    echo "[OK]: Configuring cron files..."
                    sample_function
                    if [ $? -eq 0 ]; then
                        echo '[OK]: Configuration Complete'
                        return 0
                    else
                        echo '[FAILED]: Configuration failed'
                        return 1
                    fi
                elif [ $user_answer == 'no' ];then
                    echo "[OK]: Skipping cron file configuration"
                    return 0
                else
                    echo "[ERROR]: Unknown Answer"
                    echo "[OK]: Skipping cron file configuration"
                    return 0
                fi
            fi
        fi
    fi

}

cron_files_check

if [ $? -eq 0 ]; then
    echo '[OK]: Cron and at files configuration complete'
    exit 0
else
    echo '[FAILED]: Cron and at files configuration failed'
    exit 1
fi