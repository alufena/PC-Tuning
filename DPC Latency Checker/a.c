#include <stdio.h>
#include <windows.h>
#include <stdint.h>  // For intptr_t

int main() {

    // Full path of the executable dpclat.exe (with quotes to handle spaces in the path)
    const char* exePath = "\"C:\\Program Files (x86)\\DPC Latency Checker\\dpclat.exe\"";

    // Start the dpclat.exe process in the background (no manual click required)
    HINSTANCE hInst = ShellExecute(NULL, "open", exePath, NULL, NULL, SW_HIDE);  // SW_HIDE to hide the window

    // Check if there was an error starting the process
    if ((intptr_t)hInst <= 32) {
        printf("Error starting the process. Error code: %ld\n", (intptr_t)hInst);
        return 1;
    }

    // Wait to ensure the process started correctly
    Sleep(500);

    // Find the dpclat window (adjust the window title if necessary)
    HWND hWnd = FindWindow(NULL, "Latency DPC Checker V1.4.0");

    if (hWnd != NULL) {
        // Hide the dpclat window so it does not appear on screen
        ShowWindow(hWnd, SW_HIDE); // SW_HIDE hides the window
    } else {
        printf("Window not found.\n");
    }

    return 0;
}
