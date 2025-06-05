# Script to simulate Shift+Ctrl+Windows+B
$source = @"
using System;
using System.Runtime.InteropServices;

public class KeyboardSend
{
    [DllImport("user32.dll")]
    private static extern void keybd_event(byte bVk, byte bScan, int dwFlags, int dwExtraInfo);

    private const int KEYEVENTF_KEYDOWN = 0x0000;
    private const int KEYEVENTF_KEYUP = 0x0002;

    public static void SendKeys()
    {
        // Virtual key codes
        byte VK_LSHIFT = 0xA0;    // Left SHIFT
        byte VK_LCONTROL = 0xA2;  // Left CONTROL
        byte VK_LWIN = 0x5B;      // Left Windows key
        byte VK_B = 0x42;         // B key

        // Press all keys
        keybd_event(VK_LSHIFT, 0, KEYEVENTF_KEYDOWN, 0);
        keybd_event(VK_LCONTROL, 0, KEYEVENTF_KEYDOWN, 0);
        keybd_event(VK_LWIN, 0, KEYEVENTF_KEYDOWN, 0);
        keybd_event(VK_B, 0, KEYEVENTF_KEYDOWN, 0);

        // Release all keys
        keybd_event(VK_B, 0, KEYEVENTF_KEYUP, 0);
        keybd_event(VK_LWIN, 0, KEYEVENTF_KEYUP, 0);
        keybd_event(VK_LCONTROL, 0, KEYEVENTF_KEYUP, 0);
        keybd_event(VK_LSHIFT, 0, KEYEVENTF_KEYUP, 0);
    }
}
"@

Add-Type -TypeDefinition $source -Language CSharp

# Execute the key simulation
[KeyboardSend]::SendKeys()
