import ctypes
import subprocess
import msvcrt
import sys

def is_admin():
    try:
        return ctypes.windll.shell32.IsUserAnAdmin()
    except:
        return False

def set_console_title(title):
    ctypes.windll.kernel32.SetConsoleTitleW(title)

def block_ports():
    command = 'netsh advfirewall firewall add rule name="cg" dir=out protocol=TCP interface=any remoteip=any remoteport=8080-30000 action=block program="C:\\Program Files\\TxGameAssistant\\ui\\AndroidEmulatorEx.exe" enable=yes'
    subprocess.run(command, shell=True)

def unblock_ports():
    command = 'netsh advfirewall firewall delete rule name="cg"'
    subprocess.run(command, shell=True)

def main():
    if not is_admin():
        ctypes.windll.shell32.ShellExecuteW(None, "runas", sys.executable, " ".join(sys.argv), None, 1)
        sys.exit()

    set_console_title("6HR Fixer 1SHOTxS2K")

    print("Press Any Key to Fix 6Hr")
    while True:
        msvcrt.getch()  # Wait for a keypress
        block_ports()
        print("Port blocked successfully!")
        print("")
        print(" Press any key to unblock")
        msvcrt.getch()  # Wait for another keypress
        unblock_ports()
        print("Unblocked successfully! ")
        print(" ")
        print("Press any key to Block")

if __name__ == "__main__":
    main()
