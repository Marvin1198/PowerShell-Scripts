# PowerShell VM Configuration Script

## Description

This PowerShell script automates the configuration of virtual machines (VMs) on a Windows Server. It prompts the user for various settings, such as VM name, generation, disk type, disk size, and network configuration.

## Usage

1. **Select Paths for VMs and VHDs:**
   - The script prompts the user to select paths for VMs and VHDs using a folder browser dialog.

2. **Configure VM Host:**
   - Sets the VM host's virtual hard disk and virtual machine paths based on the user's selections.

3. **Configure Network Adapter:**
   - Prompts the user to choose between an external or internal network adapter, then creates the corresponding virtual switch.

4. **Create VM:**
   - Collects user input for VM details such as name, generation, disk type, size, RAM, and external virtual switch.
   - Calls the `New-VMConfiguration` function with the provided inputs.

## Prerequisites

- PowerShell installed on your Windows Server.

## How to Run

1. Download the script file (`Script.ps1`).
2. Open a PowerShell terminal.
3. Navigate to the directory where the script is located.
4. Run the script by executing `.\Script.ps1`.

## Contributions

Contributions are welcome! If you find issues or have suggestions for improvement, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
