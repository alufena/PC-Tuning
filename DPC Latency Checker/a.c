#include <stdio.h>
#include <windows.h>
#include <stdint.h>  // Para intptr_t

int main() {

    // Caminho completo do executável dpclat.exe (com aspas para lidar com espaços no caminho)
    const char* exePath = "\"C:\\Program Files (x86)\\DPC Latency Checker\\dpclat.exe\"";

    // Iniciar o processo dpclat.exe em segundo plano (sem precisar clicar manualmente)
    HINSTANCE hInst = ShellExecute(NULL, "open", exePath, NULL, NULL, SW_HIDE);  // SW_HIDE para esconder a janela

    // Verificar se ocorreu erro ao iniciar o processo
    if ((intptr_t)hInst <= 32) {
        printf("Erro ao iniciar o processo. Código de erro: %ld\n", (intptr_t)hInst);
        return 1;
    }

    // Esperar para garantir que o processo foi iniciado corretamente
    Sleep(500);

    // Encontrar a janela do dpclat (ajuste o título da janela se necessário)
    HWND hWnd = FindWindow(NULL, "Latency DPC Checker V1.4.0");

    if (hWnd != NULL) {
        // Esconder a janela do dpclat para que ela não apareça na tela
        ShowWindow(hWnd, SW_HIDE); // SW_HIDE esconde a janela
    } else {
        printf("Janela não encontrada.\n");
    }

    return 0;
}